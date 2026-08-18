# Handmade Ceramics Store — Design

A single-shop online store: the **Ceramics Storefront** lets shoppers browse
the catalog, manage a cart, and check out as a guest or signed-in customer;
the **Ceramics Admin** app lets the store owner manage the catalog, inventory,
and order fulfillment. Both web apps call the shared **Ceramics API**, which
persists catalog and order data, validates sign-in via Thunder SSO, and
integrates with a payment provider and a transactional email provider.

## Context (C1)

```mermaid
graph TD
  Shopper((Shopper))
  StoreOwner((Store Owner))
  System[Handmade Ceramics Store]
  Thunder[Thunder SSO]
  Payment[Payment Provider]
  Email[Email Provider]

  Shopper -->|browses, buys| System
  StoreOwner -->|manages catalog and orders| System
  System -->|sign-in| Thunder
  System -->|charges| Payment
  System -->|order confirmations| Email
```

## Domain model (ER)

```mermaid
erDiagram
  CATEGORY ||--o{ PRODUCT : contains
  PRODUCT ||--o{ CART_ITEM : "added as"
  CART ||--o{ CART_ITEM : contains
  PRODUCT ||--o{ ORDER_ITEM : "purchased as"
  ORDER ||--o{ ORDER_ITEM : contains

  CATEGORY {
    string id
    string name
  }
  PRODUCT {
    string id
    string name
    string description
    decimal price
    int stockQuantity
    string categoryId
    string imageUrl
  }
  CART {
    string id
    string shopperId "nullable — guest carts have none"
  }
  CART_ITEM {
    string id
    string cartId
    string productId
    int quantity
  }
  ORDER {
    string id
    string shopperId "nullable — guest orders have none"
    string status "pending|processing|shipped|delivered"
    string shippingAddress
    decimal total
    datetime createdAt
  }
  ORDER_ITEM {
    string id
    string orderId
    string productId
    int quantity
    decimal priceAtPurchase
  }
```

## Key flows

### Shopper browses, adds to cart, and checks out as a guest

```mermaid
sequenceDiagram
  participant S as Shopper
  participant Web as Ceramics Storefront
  participant API as Ceramics API
  participant Pay as Payment Provider
  participant Mail as Email Provider

  S->>Web: Browse / search catalog
  Web->>API: GET /products?category=...
  API-->>Web: product list (with stock)
  S->>Web: Add product to cart
  Web->>API: POST /carts/{cartId}/items
  API-->>Web: updated cart
  S->>Web: Checkout (shipping + payment)
  Web->>API: POST /orders
  API->>API: verify stock, decrement inventory
  API->>Pay: charge payment method
  Pay-->>API: charge result
  API->>Mail: send order confirmation
  API-->>Web: order created
  Web-->>S: confirmation shown
```

### Store owner manages inventory and fulfills an order

```mermaid
sequenceDiagram
  participant O as Store Owner
  participant Admin as Ceramics Admin
  participant Auth as Thunder SSO
  participant API as Ceramics API

  O->>Admin: Sign in
  Admin->>Auth: OIDC sign-in
  Auth-->>Admin: token
  O->>Admin: Update stock quantity
  Admin->>API: PUT /products/{productId}
  API-->>Admin: updated product
  O->>Admin: View incoming orders
  Admin->>API: GET /orders
  API-->>Admin: order list
  O->>Admin: Mark order shipped
  Admin->>API: PATCH /orders/{orderId}/status
  API-->>Admin: updated order
```
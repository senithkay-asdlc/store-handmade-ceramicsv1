# Handmade Ceramics Store — PRD

## Problem Statement

Independent ceramics makers currently rely on generic marketplaces or ad-hoc
social-media sales to sell their work, which buries their brand, charges
marketplace fees, and gives them no direct way to manage their own catalog,
inventory, or orders. Shoppers looking for handmade ceramics have no single,
trustworthy place to browse a curated catalog, see accurate stock, and check
out smoothly.

## Solution

A dedicated online store for one ceramics maker's shop: shoppers browse a
product catalog, add pieces to a cart, and check out — with or without an
account — while the store owner manages the catalog, inventory levels, and
order fulfillment through an admin area.

## Actors

- **Shopper**: browses the product catalog, manages a cart, checks out as a
guest or signed-in customer, and (if signed in) views their order history.
- **Store Owner**: signs in to an admin area to manage the product catalog
and inventory, and to view and update the status of incoming orders.

## User Stories

1. As a Shopper, I want to browse a catalog of ceramics products, so that I
 can discover pieces I want to buy.
2. As a Shopper, I want to view a single product's details (photos,
 description, price, stock availability), so that I can decide whether to
 buy it.
3. As a Shopper, I want to search or filter the catalog (e.g. by category),
 so that I can find products faster.
4. As a Shopper, I want to add products to a cart and adjust quantities, so
 that I can collect items before buying.
5. As a Shopper, I want to remove items from my cart, so that I can correct
 mistakes before checkout.
6. As a Shopper, I want to check out as a guest, providing shipping and
 payment details, so that I can complete a purchase without creating an
 account.
7. As a Shopper, I want to sign in via SSO, so that my order history and
 details are saved for future visits.
8. As a signed-in Shopper, I want to view my past orders and their status,
 so that I can track my purchases.
9. As a Shopper, I want to receive an order confirmation after checkout, so
 that I know my purchase succeeded.
10. As a Store Owner, I want to sign in to an admin area, so that only I can
 manage the store.
11. As a Store Owner, I want to add, edit, and remove products in the
 catalog, so that I can keep listings current.
12. As a Store Owner, I want to set and update stock quantities for each
 product, so that shoppers never buy something I can't fulfill.
13. As a Store Owner, I want the store to prevent checkout of out-of-stock
 items, so that I don't oversell limited handmade inventory.
14. As a Store Owner, I want to view incoming orders and update their
 fulfillment status (e.g. processing, shipped, delivered), so that I can
 manage fulfillment.

## Product Decisions

- Single-shop model: one store owner manages the entire catalog; this is not
a multi-vendor marketplace.
- Guest checkout is allowed; account sign-in is optional for shoppers and
used to retain order history.
- Sign-in, for both shoppers who choose to and the store owner, goes through
Thunder SSO, the platform identity provider *(org default)*.
- Products carry restockable inventory (a quantity on hand) rather than being
strictly one-of-a-kind; the store owner updates stock as pieces are made or
sold.
- The store owner has a dedicated admin area for catalog and order
management, reachable only when signed in.
- Shipping is domestic only for this release; no international address,
currency, or customs handling is required.
- The product depends on a payment-processing capability to charge shoppers
at checkout *(assumed — capability only; provider selection happens at
design time)*.
- Shoppers receive order-confirmation notifications via email *(assumed)*.

## Out of Scope

- Multi-vendor/marketplace support (multiple independent sellers).
- International shipping, multi-currency pricing, and customs handling.
- Product reviews, ratings, or wishlists.
- Discount codes, promotions, or gift cards.
- Returns/refunds management workflow.
- Advanced marketing features (email campaigns, abandoned-cart recovery).

## Open Questions

1. Which payment processor should the store integrate with? — deferred; not
 required to unblock design, since the PRD only commits to the capability.

## Further Notes

None.
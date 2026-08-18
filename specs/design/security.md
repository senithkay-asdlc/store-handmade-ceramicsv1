# Security design

## Roles → permissions

No role may access another role's protected actions: a Shopper token never
grants catalog-management or order-status-update access, and the admin app is
unreachable without a Store Owner sign-in.

## Authentication (Thunder)

- Shared dependency name: **`user-auth`** — declared identically on
Ceramics Storefront, Ceramics Admin, and Ceramics API, tying sign-in on the
web apps to token-carrying calls into the API.
- Scopes: `openid profile email` (default).
- Sign-in is **optional** on Ceramics Storefront (guest checkout is allowed)
and **required** on Ceramics Admin (no unauthenticated screen exists there).
- Ceramics API sits behind the gateway and validates every token; public
catalog/cart/checkout endpoints accept anonymous calls, while
catalog-management and order-management endpoints require a valid token
mapped to the Store Owner role.

## Role resolution

- Ceramics API resolves the caller's role from the identity the gateway
injects (`X-User-Id` plus the token's role claim). A token without a
Store Owner role claim is denied on any catalog-management or
order-management endpoint (403).
- An unauthenticated call to a public endpoint (catalog browsing, cart,
guest checkout) is allowed; an unauthenticated call to any admin-only
endpoint is denied (401).
- There is exactly one Store Owner in this single-shop design — no
per-seller scoping is required.
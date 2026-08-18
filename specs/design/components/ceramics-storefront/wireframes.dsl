// Ceramics Storefront — shopper-facing screens

screen Catalog "Shopper browses and searches the ceramics catalog"
  navbar "Ceramics Co. | Shop -> Catalog | Cart -> CartScreen | Sign in -> SignIn"
  row
    heading "Handmade Ceramics"
    right
    search "Search products…"
    select "Category: All"
  row
    card "Products | 42 | across 6 categories"
    card "New this week | 5 | freshly listed"
  table "Product | Category | Price | Stock" -> ProductDetail
    row "Speckled Stoneware Mug | Mugs | $28 | In stock"
    row "Matte Blue Vase | Vases | $54 | In stock"
    row "Textured Serving Bowl | Bowls | $46 | Only 2 left"
    row "Sold-out Teapot | Teapots | $72 | Out of stock"

screen ProductDetail "Shopper views a product's details before buying"
  navbar "Ceramics Co. | Shop -> Catalog | Cart -> CartScreen | Sign in -> SignIn"
  breadcrumb "Shop / Mugs / Speckled Stoneware Mug"
  row
    heading "Speckled Stoneware Mug"
    badge "In stock" success
  image "Product photo"
  text "$28 — hand-thrown stoneware mug with a reactive speckled glaze."
  row
    select "Quantity: 1"
    right
    button "Add to cart" primary -> CartScreen

screen CartScreen "Shopper reviews cart contents before checkout"
  navbar "Ceramics Co. | Shop -> Catalog | Cart -> CartScreen | Sign in -> SignIn"
  heading "Your Cart"
  table "Product | Price | Quantity | Subtotal"
    row "Speckled Stoneware Mug | $28 | 2 | $56"
    row "Matte Blue Vase | $54 | 1 | $54"
  row
    right
    text "Total: $110"
  row
    right
    button "Continue shopping"
    button "Checkout" primary -> Checkout

screen Checkout "Shopper enters shipping and payment details to complete a guest or signed-in purchase"
  navbar "Ceramics Co. | Shop -> Catalog | Cart -> CartScreen | Sign in -> SignIn"
  heading "Checkout"
  text "Order total: $110"
  input "Full name"
  input "Shipping address"
  input "City, state, ZIP"
  input "Card number"
  row
    input "Expiry"
    input "CVC"
  row
    right
    button "Place order" primary -> OrderConfirmation

screen OrderConfirmation "Shopper sees confirmation that checkout succeeded"
  navbar "Ceramics Co. | Shop -> Catalog | Cart -> CartScreen | Sign in -> SignIn"
  heading "Order confirmed"
  badge "Pending" info
  text "Order #10432 — a confirmation email is on its way."
  text "We'll notify you as your order is processed and shipped."
  button "Back to shop" -> Catalog

screen SignIn "Shopper signs in via SSO to save order history, or continues as guest"
  navbar "Ceramics Co. | Shop -> Catalog | Cart -> CartScreen | Sign in -> SignIn"
  heading "Sign in"
  text "Sign in to view your order history and speed up future checkouts."
  button "Sign in with SSO" primary -> OrderHistory
  link "Continue as guest" -> Catalog

screen OrderHistory "Signed-in shopper reviews their past orders and statuses"
  navbar "Ceramics Co. | Shop -> Catalog | Cart -> CartScreen | Sign in -> SignIn"
  heading "Your Orders"
  table "Order | Date | Total | Status"
    row "#10432 | Aug 12 | $110 | Processing"
    row "#10310 | Jul 28 | $46 | Delivered"

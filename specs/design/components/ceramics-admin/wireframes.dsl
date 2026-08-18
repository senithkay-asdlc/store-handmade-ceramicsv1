// Ceramics Admin — store owner screens

screen AdminSignIn "Store owner signs in via SSO to reach the admin area"
  navbar "Ceramics Admin"
  heading "Store Owner Sign In"
  text "Sign in with your store owner account to manage the catalog and orders."
  button "Sign in with SSO" primary -> ProductList

screen ProductList "Store owner reviews and manages the product catalog"
  navbar "Ceramics Admin"
  sidebar "Products -> ProductList | Orders -> OrderQueue | Settings"
  row
    heading "Products"
    right
    search "Search products…"
    button "Add product" primary -> ProductEditor
  row
    card "Total products | 42 | across 6 categories"
    card "Out of stock | 3 | need restocking"
  table "Product | Category | Price | Stock | " -> ProductEditor
    row "Speckled Stoneware Mug | Mugs | $28 | 14 | Edit →"
    row "Matte Blue Vase | Vases | $54 | 6 | Edit →"
    row "Sold-out Teapot | Teapots | $72 | 0 | Edit →"

screen ProductEditor "Store owner adds or edits a product and its stock quantity"
  navbar "Ceramics Admin"
  sidebar "Products -> ProductList | Orders -> OrderQueue | Settings"
  breadcrumb "Products / Speckled Stoneware Mug"
  heading "Edit Product"
  input "Name — e.g. Speckled Stoneware Mug"
  textarea "Description"
  row
    input "Price"
    input "Stock quantity"
    select "Category: Mugs"
  input "Image URL"
  row
    right
    button "Delete" danger
    button "Save product" primary -> ProductList

screen OrderQueue "Store owner views incoming orders and their fulfillment status"
  navbar "Ceramics Admin"
  sidebar "Products -> ProductList | Orders -> OrderQueue | Settings"
  row
    heading "Orders"
    right
    select "Status: All"
  row
    badge "All (58)"
    badge "Pending (4)" warning
    badge "Processing (9)" info
    badge "Shipped (30)"
    badge "Delivered (15)" success
  table "Order | Customer | Total | Status | " -> OrderDetail
    row "#10432 | Guest checkout | $110 | Processing | Update →"
    row "#10430 | J. Alvarez | $54 | Pending | Update →"
    row "#10425 | Guest checkout | $28 | Shipped | Update →"

screen OrderDetail "Store owner updates one order's fulfillment status"
  navbar "Ceramics Admin"
  sidebar "Products -> ProductList | Orders -> OrderQueue | Settings"
  breadcrumb "Orders / #10432"
  row
    heading "Order #10432"
    badge "Processing" info
  text "Shipped to: 214 Maple St, Springfield — placed Aug 12"
  table "Product | Quantity | Price"
    row "Speckled Stoneware Mug | 2 | $56"
    row "Matte Blue Vase | 1 | $54"
  row
    select "Status: Processing"
    right
    button "Update status" primary -> OrderQueue

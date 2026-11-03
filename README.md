# PureMILK – Dairy Supply Chain Database (MySQL)

A relational database for a dairy business that moves milk from farmers through
chilling centres and factories to dealers, and tracks orders and payments.

## Tables
| Table | Purpose | Primary key |
|---|---|---|
| factory | Dairy factories | Factory_id |
| chilling_center | Milk collection centres, each linked to a factory | Center_id |
| farmer | Farmers, each linked to a collection centre | Farmer_id |
| milk_transaction | Milk collections with fat content and payment status | Milk_Transaction_id |
| dealer | Businesses that order dairy products | Dealer_id |
| product | Dairy products with price and expiry date | Product_id |
| order_table | Dealer orders | order_id |
| order_product | Products in each order (links orders and products) | order_id + Product_id |

## Relationships
- One factory has many chilling centres
- One chilling centre has many farmers and many milk transactions
- One dealer places many orders
- Orders and products are linked through `order_product` (many-to-many)

## Integrity rules
- Primary keys on every table
- Foreign keys stop invalid links, e.g. a chilling centre cannot point to a factory that doesn't exist
- Foreign keys stop deleting a dealer who still has orders

## Repository structure
- `schema.sql`: creates the database and tables (no data)
- `data/`: sample data, one file per table
- `queries/`: example queries

## Example queries (`queries/`)

Farmers and centres:
- `farmers_per_centre.sql`: farmers registered at each chilling centre
- `factory_centre_summary.sql`: centres and total capacity per factory
- `average_rate_per_centre.sql`: average price paid per unit at each location

Milk and payments:
- `unpaid_milk_transactions.sql`: collections that have not been paid
- `high_fat_milk.sql`: collections with fat content of 3.8% or more

Dealers and orders:
- `active_dealers.sql`: active dealers, largest credit limit first
- `dealer_order_totals.sql`: orders and total spend per dealer
- `dealers_without_orders.sql`: dealers who have never ordered
- `orders_by_month.sql`: monthly order count and revenue
- `product_sales.sql`: units sold and revenue per product

Products:
- `expired_products.sql`: products past their expiry date
- `category_price_summary.sql`: product count and price range per category
- `order_quantity_over_10.sql` and `cheapest_product_per_category.sql`: the original two queries

Note: the order tables have no sample rows, so queries that use orders
(`dealer_order_totals`, `product_sales`, `orders_by_month`, and `order_quantity_over_10`)
return no results or zeros. The others return data from the sample tables.

## How to run
1. Open MySQL Workbench and run `schema.sql` to create the `pure_milk` database and tables.
2. Run the files in `data/` to load the sample data.
3. Run any file in `queries/`.

## Testing
| Test | Expected result | Result |
|---|---|---|
| Chilling centre with an unknown factory ID | Rejected by foreign key | Pass |
| Delete a dealer who has orders | Rejected by foreign key | Pass |
| Insert a duplicate dealer ID | Rejected by primary key | Pass |
| Product with no expiry date | Rejected by NOT NULL | Fail: `Expire_date` allows NULL in this version |

## What I'd improve next
- Make `Expire_date` required (NOT NULL) so the failing test passes
- Add sample orders so the order-based queries return results
- Use DATE and TIME types instead of text for dates and collection times
- Add CHECK rules for fat content and payment status
- Add an audit log table to record who changed what

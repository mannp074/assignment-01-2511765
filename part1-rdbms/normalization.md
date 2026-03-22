## Anomaly Analysis

### Insert Anomaly

In the current table structure, it is not possible to insert a new product without creating an order. For example, if a new product (product_id, product_name, category, unit_price) needs to be added but no customer has ordered it yet, there is no way to store this information because order_id and customer details are mandatory. This leads to incomplete data insertion.

### Update Anomaly

Customer and product details are repeated across multiple rows. For example, if a customer’s city (customer_city) or email (customer_email) changes, it must be updated in all rows where that customer appears. If one row is missed, it results in inconsistent data. Similarly, changes in product price (unit_price) must be updated across all related rows.

### Delete Anomaly

If a row corresponding to an order is deleted, important information may be lost. For example, if a product was ordered only once and that row is deleted, all information about that product (product_id, product_name, category, unit_price) is lost. Similarly, deleting the only order of a customer removes all their details from the database.


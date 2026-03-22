## Anomaly Analysis

### Insert Anomaly

In the current table, it is not possible to insert a new product without creating an order. For example, product_id P008 (a new product) cannot be added unless an order_id, customer_id, and other order-related fields are also provided. Since product information (product_id, product_name, category, unit_price) is tightly coupled with order data, new products cannot exist independently in the system.

### Update Anomaly

There is significant redundancy in the dataset. For example, the customer "Neha Gupta" (customer_id C006) appears in multiple rows such as ORD1153, ORD1118, and ORD1083. If her email or city changes, it must be updated in all these rows. Missing even one row would result in inconsistent data.

Similarly, the product "Pen Set" (product_id P007) appears in multiple orders such as ORD1114, ORD1153, ORD1118, ORD1132, ORD1037, and ORD1083. If the unit_price changes from 250 to another value, it must be updated across all these rows, increasing the risk of inconsistency.

### Delete Anomaly

Deleting a single row can result in loss of important information. For example, if the row ORD1075 is deleted, all information about the product "Desk Chair" (product_id P003) is lost if it does not appear in any other row. This results in unintended data loss.

Similarly, if the only order of a customer is deleted, their entire information (customer_id, customer_name, customer_email, customer_city) is also removed from the database.




## Normalization Justification

Putting everything in one table sounds easy at first, but it causes a lot of problems as the data grows. In this orders dataset, customer details, product info, and sales rep data are all mixed together in the same rows, which creates unnecessary repetition.
For example, "Neha Gupta" (customer_id C006) shows up in multiple orders like ORD1153, ORD1118, and ORD1083. If her email or city changes, you have to go and update every single row she appears in. If you miss even one row, the data becomes wrong and unreliable. Same thing with "Pen Set" (product_id P007) — it appears in many orders, so changing its price means updating many rows instead of just one.
Deleting data can also cause unexpected problems. If you delete the only order that includes "Desk Chair" (product_id P003), all the information about that product gets wiped out too — even though you never meant to delete the product itself.
This is exactly why we use normalization. By splitting the data into separate tables for customers, products, orders, and sales reps, we avoid all these issues. Sure, it means more tables — but updates become easier, data stays accurate, and the whole database becomes much easier to manage over time. For any real-world system, this is simply the better way to build it.

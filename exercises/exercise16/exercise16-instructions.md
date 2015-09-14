# Exercise 16 - Order Tracking

---

### Exercise 16.a - Create a Order Lookup View

Create a view that will allow for orders to be retrieved by a combination of the following fields: 

- order_id
- billing_email
- billing_postal_code

**1\.** Open up the Couchbase Admin Console by going to [http://127.0.0.1:8091/](http://127.0.0.1:8091/) in a web browser

**2\.** Choose [Data Buckets](http://127.0.0.1:8091/index.html#sec=buckets)

**3\.** Click the "[Views](http://127.0.0.1:8091/index.html#sec=views&viewsBucket=default)" button next to the **default** bucket

**4\.** Click the "Development Views" tab, since we already have a Design Document, click the "Add View" button next to `design/dev_orders`

**5\.** For the **View Name** use `lookup`

**6\.** Click the "Save" button

**7\.** Write a map function that will meet the requirements listed above.  You will need to use a compound key and the value should be null.

**8\.** You can leave the  **Reduce** function empty and click the "Save" button

**9\.** We now need to publish our Development View to Production.  To do this scroll up to the top of the page, and click on [Views](http://127.0.0.1:8091/index.html#sec=views&viewsBucket=default).

**10\.** Make sure you are on the **Development Views** tab and next to `_design/dev_products` click on the "Publish" button.  You will get a notification that the Design Document already exists and it will ask you to confirm that you want to overwrite it, click "Confirm". This will move your `product` Design Document to production and create the index against all of the documents in the entire bucket for all of the views in the view.On Sale

---

### Exercise 16.b - Retrieve Placed Order

We need to display the shipping options to our users.

**1\.** Open `exercise15/com/example/OrderTrackingService.cfc` in your IDE

**2\.** Modify the `getOrder` method to retrieve query the `lookup` view that you created in Exercise 16.a. 

- Limit the Results to 1
- Inflate the Results to `com.example.documents.Order`
- Tip - You will need to use the ColdFusion `int()` function when referencing the `order_id` argument

For your reference the data from the `getShippingMethods` method is used in the following views:

- exercise16/com/example/documents/Order.cfc
- exercise16/view/order-tracking.cfm
- exercise16/view/includes/invoice.details.cfm
- exercise16/view/includes/invoice.items.cfm
- exercise16/view/includes/checkout.totals.cfm

Open [/exercise16/order-tracking.cfm](/exercise16/order-tracking.cfm) in your web browser, and lookup any previously placed orders.  If you need test data open your Couchbase Admin Console and retrieve documents named `order_XXXX` where XXXX is a number between 1 - 5000.


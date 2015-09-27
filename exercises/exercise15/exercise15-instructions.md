# Exercise 15 - Writing Order Documents on Checkout

---

### Exercise 15.a - Retrieve the States

As with any checkout process we need to be able to display the available states in a dropdown.

**1\.** Open `exercise15/com/example/CheckoutService.cfc` in your IDE

**2\.** Modify the `getStates` method to retrieve the available states. This will call the CFCouchbase `get()` method with an id of `states`, the result of this call should be assigned to a variable named `doc`

For your reference the data from the `getStates` method is used in the following views:

- exercise15/view/includes/checkout.billing.cfm
- exercise15/view/includes/checkout.shipping.cfm

---

### Exercise 15.b - Retrieve the Shipping Methods

We need to display the shipping options to our users.

**1\.** Open `exercise15/com/example/CheckoutService.cfc` in your IDE

**2\.** Modify the `getShippingMethods` method to retrieve the available states. This will call the CFCouchbase `get()` method with an id of `shipping_methods`, the result of this call should be assigned to a variable named `doc`

For your reference the data from the `getShippingMethods` method is used in the following views:

- exercise15/view/includes/checkout.payment.cfm

---

### Exercise 15.c - Get the Next Order ID

**1\.** Open `exercise15/com/example/documents/Order.cfc` in your IDE

**2\.** Modify the `save` method to retrieve get the next available `order_id`. This will call the CFCouchbase `incr()` method with the following arguments. The result of this call should be assigned to a variable named `order_id`

- id = "orders_counter"
- value = 1
- defaultValue = 1

---

### Exercise 15.d - Write the Order

**1\.** Open `exercise15/com/example/documents/Order.cfc` in your IDE

**2\.** Modify the `save` method to write the order. This will call the CFCouchbase `set()` method with the following arguments:

- id = "order_id" & getOrder_ID()
- value = this

**3\.** Open the homepage ([/exercise15/index.cfm](/exercise15/index.cfm)) and browse the website adding different products to your cart.  Then place an order.

For your reference the data from the `save` method is used in the following views:

- exercise15/view/invoice.cfm
- exercise15/view/includes/invoice.details.cfm
- exercise15/view/includes/invoice.items.cfm
- exercise15/view/includes/checkout.totals.cfm

Open [/exercise15/index.cfm](/exercise15/index.cfm) in your web browser, add products to your cart and place an order.  Lookup the generated Order Document in your Couchbase Admin Console.


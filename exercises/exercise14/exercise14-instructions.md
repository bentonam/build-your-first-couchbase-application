# Exercise 14 - Creating a Shopping Cart

---

### Exercise 14.a - Retrieving the Shopping Cart

We need to be able to retrieve the shopping cart and display the contents in the header and cart page.

**1\.** Open `exercise14/com/example/CartService.cfc` in your IDE


**2\.** Modify the `getCart` method to call the CFCouchbase method `getAndTouch()` with the following arguments:

- id = session.sessionID & "_cart"
- inflateTo = "com.example.documents.Cart"
- timeout = 30

For your reference the data from the `getCart` method is used in the following views:

- exercise14/view/layout/layout.header.cart.cfm
- exercise14/view/cart.cfm

---

### Exercise 14.b - Saving the Shopping Cart

We need to be able to add products to our shopping cart.

**1\.** Open `exercise14/com/example/documents/Cart.cfc` in your IDE

**2\.** Modify the `save` method to write the shopping cart, this will use the CFCouchbase `set()` method, writing the contents and setting a new timeout of 30 minutes. The `set()` method will use the following arguments:

- id = session.sessionID & "_cart"
- value = this
- timeout = 30

**3\.** Open the homepage ([/exercise14/index.cfm](/exercise14/index.cfm)) and browse the website adding different products to your cart.  Update the values, remove items and lookup the Cart's Document ID in the Couchbase Admin Console.

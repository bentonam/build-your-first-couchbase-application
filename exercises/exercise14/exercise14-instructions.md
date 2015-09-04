# Exercise 14 - Creating a Shopping Cart

---

### Exercise 14.a - Retrieving the Shopping Cart

**1\.** Open `exercise14/com/example/CartService.cfc` in your IDE

**2\.** Modify the `getCart` method to retrieve the shopping cart document. This will call the CFCouchbase `getAndTouch()` method with the following arguments:

```
cart = cb.getAndTouch(
	id=session.sessionID & "_cart",
	inflateTo="com.example.documents.Cart",
	timeout=30
);
```

For your reference the data from the `getCart` method is used in the following views:

- exercise14/view/layout/layout.header.cart.cfm
- exercise14/view/cart.cfm

---

### Exercise 14.b - Saving the Shopping Cart

**1\.** Open `exercise14/com/example/documents/Cart.cfc` in your IDE

**2\.** Modify the `save` method to write the shopping cart, and set a timeout of 30 minutes. This will use the following arguments:

```
cb.set(
	id=getCart_ID(),
	value=this,
	timeout=30
);
```

Browse the website and add different products to your cart.  Update the values, remove items and lookup the Cart's Document ID in the Couchbase Admin Console.

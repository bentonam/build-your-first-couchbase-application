# Exercise 3 - Multi Get Keys

---

### Exercise 3.a - Retrieve the Recent Products

**1\.** Open `exercise3/com/example/ProductService.cfc` in your IDE

**2\.** Modify the `getRecentProducts` method to retrieve the `recent_products` document by calling the CFCouchbase `get()` method passing the argument of `"recent_products"`.  

```
recent_products = cb.get(id="recent_products");
```

The document is structured as follows:

```
{
	"doc_type": "config",
	"products": [
		"db2f3494-c030-491b-ab179c32d98b1345",
		"5d1c4462-f69d-4fe6-bddc4397c165fca9",
		"bda46f2c-2a07-44f3-afbd8738aa25cccc",
		"91f2683e-a79b-4002-8b2daf1fd4aa6672",
		"7d944f17-db36-4948-b90d582a067ed714",
		"858d0489-bb8d-4c4f-a9c875310c39e0b7",
		"4825b83f-9ae8-4361-93ff48faed868cb5",
		"de87c930-67d3-49d3-b1fcda43b9231c88"
	]
}
```

**3\.** After you have retrieved the `recent_products` document, call the CFCouchbase `getMulti()` method passing it the products property array.  This will return you a structure of each document with each key being the Document ID.

```
products = cb.getMulti(id=recent_products.products);
```

**4\.** Open the homepage ([/exercise3/index.cfm](/exercise3/index.cfm)) and verify that you are seeing recent products being displayed.

For your reference the data from the `getRecentProducts` method is used in the following views:

- exercise3/view/includes/home.recent.cfm
- exercise3/view/includes/template.product.cfm

Open the homepage ([/exercise3/index.cfm](/exercise3/index.cfm)) and verify that the New Products are displaying correctly.

---

### Exercise 3.b - Retrieve the Sale Products

**1\.** Open `exercise3/com/example/ProductService.cfc` in your IDE


**2\.** Modify the `getSaleProducts` method to retrieve the `sale_products` document by calling the CFCouchbase `get()` method passing the argument of `"sale_products"` assigning the result to the `sale_products` variable.

The document is structured as follows:

```
{
	"doc_type": "config",
	"products": [
		"18099658-70d7-4c0e-be1f1ca0d3f07642",
		"451f05ff-c881-4cbb-b6e4edd619c87da7",
		"f5a70d7e-fd7c-4711-ab5b2e4019e13315",
		"27fc7858-3b1d-467d-b4d1feaaa89b0c5c",
		"58559b29-12ba-4066-baf2d42e81567a00",
		"7dfbbb40-4c2c-4ca6-95c8c7c024b987a4",
		"9f6ef86d-e9e1-4f55-884b499e16081147",
		"71578029-5fc8-49ba-a5288dbce8d4a0d8"
	]
}
```

**3\.** After you have retrieved the `sale_products` document, call the CFCouchbase `getMulti()` method passing it the products property array.  This will return you a structure of each document with each key being the Document ID.

**4\.** Open the homepage ([/exercise3/index.cfm](/exercise3/index.cfm)) and verify that you are seeing sale products being displayed.

For your reference the data from the `getSaleProducts` method is used in the following views:

- exercise3/view/includes/home.sale.cfm
- exercise3/view/includes/template.product.cfm

Open the homepage ([/exercise3/index.cfm](/exercise3/index.cfm)) and verify that the Sale Products are displaying correctly.
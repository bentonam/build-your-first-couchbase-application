# Exercise 4 - Introduction to Queries

---

### Exercise 4.a - Create a Categories View in Couchbase

**1\.** Open up the Couchbase Admin Console by going to [http://127.0.0.1:8091/](http://127.0.0.1:8091/) in a web browser

**2\.** Choose [Data Buckets](http://127.0.0.1:8091/index.html#sec=buckets)

**3\.** Click the "[Views](http://127.0.0.1:8091/index.html#sec=views&viewsBucket=default)" button next to the **default** bucket

**4\.** Click the "Create Development View" button

**5\.** For the **Design Document Name** use `products`. Note that the full design document name will be `_design/dev_products`

**6\.** For the **View Name** use `by_category`

**7\.** Click the "Save" button

**8\.** Click the "Edit" button, next to the `by_category` view that you just created.

**9\.** Use the following JavaScript as the **Map** function for the view.  This will create a view whose value is the category name, if it has a `doc_type` property whose value is "product" and the document has a `category` property.  The value in the index is *null*.

```
function (doc, meta) {
  if(doc.doc_type && doc.doc_type === "product" && doc.category){
    emit(doc.category, null);
  }
}
```

**10\.** For the **Reduce** function enter the value of `_count` and click the "Save" button

You can click on the "Show Results" button to see partial data from index.  To prevent the reduce function from being applied click the down arrow next to "Filter Results", and click *false* next to reduce in the drop down menu. 

**11\.** We now need to publish our Development View to Production.  To do this scroll up to the top of the page, and click on [Views](http://127.0.0.1:8091/index.html#sec=views&viewsBucket=default).

**12\.** Make sure you are on the **Development Views** tab and next to `_design/dev_products` click on the "Publish" button.  This will move your `product` Design Document to production and create the index against all of the documents in the entire bucket for the view `by_category`.

---

### Exercise 4.b - Querying the Categories View

There are 2 queries that need to be performed, the first is we need to get the true total number of products in the category for pagination, and the second is to get the actual products that match the category on a given page as there are only 24 products shown at a time.

**1\.** Open `exercise4/com/example/CategoryService.cfc` in your IDE

**2\.** Modify the `getProductsTotalForCategory` method to query Couchbase View. This will call the CFCouchbase `query()` method with the following arguments:

```
query = cb.query(
	designDocumentName = "products",
	viewName = "by_category",
	options = {
		key = arguments.category
	}
);
```

**3\.** Modify the `getProductsByCategory` method to query Couchbase View. This will call the CFCouchbase `query()` method with the following arguments:

```
query = cb.query(
	designDocumentName = "products",
	viewName = "by_category",
	options = {
		reduce = false,
		includeDocs = true,
		key = arguments.category,
		limit = arguments.limit,
		offset = arguments.offset,
	}
);
```

Notice how the reduce option is set to false, this tells Couchbase to not run the reduce function and just return the results from the map function only.

**4\.** Open the homepage ([/exercise4/index.cfm](/exercise4/index.cfm)) and click on any category from the menu to verify that you are seeing results.

For your reference the data from the `getProductsTotalForCategory` and `getProductsByCategory` methods are used in the following views:

- exercise4/view/categories.cfm
- exercise4/view/includes/template.product.cfm

---

### Exercise 4.c - Create a Brands View in Couchbase

**1\.** Open up the Couchbase Admin Console by going to [http://127.0.0.1:8091/](http://127.0.0.1:8091/) in a web browser

**2\.** Choose [Data Buckets](http://127.0.0.1:8091/index.html#sec=buckets)

**3\.** Click the "[Views](http://127.0.0.1:8091/index.html#sec=views&viewsBucket=default)" button next to the **default** bucket

**4\.** Click the "Development Views" tab, since we already have a Design Document, click the "Add View" button next to `design/dev_products`

**5\.** For the **View Name** use `by_brand`

**6\.** Click the "Save" button

**7\.** Based on what you learned in Exercise 4.a create a view that will output the `brand` property for each document that has a `doc_type` of "product" and has the `brand` property present.

**8\.** For the **Reduce** function enter the value of `_count` and click the "Save" button

**9\.** We now need to publish our Development View to Production.  To do this scroll up to the top of the page, and click on [Views](http://127.0.0.1:8091/index.html#sec=views&viewsBucket=default).

**10\.** Make sure you are on the **Development Views** tab and next to `_design/dev_products` click on the "Publish" button.  You will get a notification that the Design Document already exists and it will ask you to confirm that you want to overwrite it, click the "Confirm" button. This will move your `product` Design Document to production and create the index against all of the documents in the entire bucket for all of the views in the view.

---

### Exercise 4.d - Querying the Brands View

There are 2 queries that need to be performed, the first is we need to get the true total number of products for the brand for pagination, and the second is to get the actual products that match the brand on a given page as there are only 24 products shown at a time.

**1\.** Open `exercise4/com/example/BrandService.cfc` in your IDE

**2\.** Using what you learned in Exercise 4.b modify the `getProductsTotalForBrand` method to query Couchbase Design Document of `products` and the View `by_brand`. 

**3\.** Using what you learned in Exercise 4.b modify the `getProductsByBrand` method to query Couchbase Design Document of `products` and the View `by_brand` and get the results.

**4\.** Open the homepage ([/exercise4/index.cfm](/exercise4/index.cfm)) and click on any Brand from the menu to verify that you are seeing results.

**5\.** For your reference the data from the `getProductsTotalForBrand` and `getProductsByBrand` methods are used in the following views:

- exercise4/view/brands.cfm
- exercise4/view/includes/template.product.cfm
# Exercise 7 - Working with Dates using Compound Keys and Range Queries

---

### Exercise 7.a - Create a Recent Products View in Couchbase

**1\.** Open up the Couchbase Admin Console by going to [http://127.0.0.1:8091/](http://127.0.0.1:8091/) in a web browser

**2\.** Choose [Data Buckets](http://127.0.0.1:8091/index.html#sec=buckets)

**3\.** Click the "[Views](http://127.0.0.1:8091/index.html#sec=views&viewsBucket=default)" button next to the **default** bucket

**4\.** Click the "Development Views" tab, since we already have a Design Document, click the "Add View" button next to `design/dev_products`

**5\.** For the **View Name** use `on_sale`

**6\.** Click "Save"

**7\.** Use the following JavaScript as the **Map** function for the view.  This will create a view whose value is a compound key / array of date parts.  The value in the index is *null*.  This will only emit documents to the index that match the following.

	1. Have a `doc_type` property with a value of "product"
	2. Have a `product_id` property
	3. Have an `availability_date` property
	4. Have an `availability` property with a value of "In-Stock"

```
function (doc, meta) {
  if(
    doc.doc_type && 
    doc.doc_type === "product" && 
   	doc.product_id && 
   	doc.availability_date &&
  	doc.availability &&
  	doc.availability == "In-Stock"
  ){
    emit(dateToArray(doc.availability_date), null);
  }
}
```

**8\.** For the **Reduce** function enter the value of `_count` and click the "Save" button.  You can click on the "Show Results" button to see partial data from index.  

**9\.** We now need to publish our Development View to Production.  To do this scroll up to the top of the page, and click on [Views](http://127.0.0.1:8091/index.html#sec=views&viewsBucket=default).

**10\.** Make sure you are on the **Development Views** tab and next to `_design/dev_products` click on the "Publish" button.  You will get a notification that the Design Document already exists and it will ask you to confirm that you want to overwrite it, click "Confirm". This will move your `product` Design Document to production and create the index against all of the documents in the entire bucket for all of the views in the view.On Sale

---

### Exercise 7.b - Querying the Recent View

On the homepage we need to output products whose data indicates that they are actually on sale, instead of a hard-coded list, we will want to limit out results to 8 products.

**1\.** Open `exercise7/com/example/ProductService.cfc` in your IDE

**2\.** Modify the `getRecentProducts` method to query Couchbase View. This will call the CFCouchbase `query()` method with the following arguments:

```
query = cb.query(
	designDocumentName = "products",
	viewName = "recent",
	options = {
		reduce = false,
		startKey = variables.utils.getDateParts(now()),
		limit = arguments.limit,
		offset = arguments.offset,
		includeDocs = true
	}
);
```


**3\.** Open the homepage ([/exercise7/index.cfm](/exercise7/index.cfm)) and see if your Recent Products is displaying. 

For your reference the data from the `getSaleProducts` method is used in the following views:

- exercise7/view/includes/home.recent.cfm
- exercise7/view/includes/template.product.cfm

---

### Exercise 7.c - Browsing All Recent Products

From our listing of Recent Products on the homepage, there is a "View More" button that will allow our users to browse through all of the Recent products from newest to oldest. This view will need to know the total number of Recent products to calculate the paging correctly. 

**1\.** Open `exercise7/com/example/ProductService.cfc` in your IDE

**2\.** Modify the `getRecentProductsTotal` method to query Couchbase View. This will call the CFCouchbase `query()` method with the following arguments:

```
query = cb.query(
	designDocumentName = "products",
	viewName = "on_sale"
);
```

**3\.** Open the homepage ([/exercise7/index.cfm](/exercise7/index.cfm)) and click on the "View More" button next to the On Sale Products Listing

For your reference the data from the `getRecentProducts` and `getRecentProductsTotal` methods are used in the following views:

- exercise7/view/includes/home.recent.cfm
- exercise7/view/includes/template.product.cfm
- exercise7/view/recent.cfm

---

### Exercise 7.d - Update the On Sale Products View in Couchbase

In Exercise 6.a we created a view that would provide the currently On Sale products, and all we were emitting was the `doc.product_id` property.  We failed to take into account of the availability date of the product was in the future. 

**1\.** Open up the Couchbase Admin Console by going to [http://127.0.0.1:8091/](http://127.0.0.1:8091/) in a web browser

**2\.** Choose [Data Buckets](http://127.0.0.1:8091/index.html#sec=buckets)

**3\.** Click the "[Views](http://127.0.0.1:8091/index.html#sec=views&viewsBucket=default)" button next to the **default** bucket

**4\.** Click the "Development Views" tab, since we already have a Design Document, click the "Edit" button next to `on_sale` view

**5\.** Instead of emitting the `doc.product_id` as the key to the view, emit the `doc.availability_date` property using the `dateToArray()` method that was used in Exercise 7.a

**6\.** Click "Save", You can click on the "Show Results" button to see partial data from index.  

**7\.** We now need to publish our Development View to Production.  To do this scroll up to the top of the page, and click on [Views](http://127.0.0.1:8091/index.html#sec=views&viewsBucket=default).

**8\.** Make sure you are on the **Development Views** tab and next to `_design/dev_products` click on the "Publish" button.  You will get a notification that the Design Document already exists and it will ask you to confirm that you want to overwrite it, click "Confirm". This will move your `product` Design Document to production and create the index against all of the documents in the entire bucket for all of the views in the view.On Sale

---

### Exercise 7.e - Querying the On Sale View

We need to make sure the On Sale products we are showing on the homepage and browse page is only showing current products.  

Open `exercise7/com/example/ProductService.cfc` in your IDE

**1\.** Modify the `getSaleProducts` method to add an option of `startKey`, whose value is using the Utils convenience method of `getDateParts()` with a value of `1/1/1970` or some date in the past before our products become available

**2\.** Since we do not want to show any products in the future, we will also need to specify the `endKey` whose value is using the Utils convenience method of `getDateParts()` with a value of `now()` or some date in the past before our products become available

**3\.** Modify the `getSaleProductsTotal` method to add an option of `startKey`, , whose value is using the Utils convenience method of `getDateParts()` with a value of `1/1/1970` or some date in the past before our products become available

**4\.** Since we do not want to show any products in the future, we will also need to specify the `endKey` whose value is using the Utils convenience method of `getDateParts()` with a value of `now()` or some date in the past before our products become available

**5\.** Open the homepage ([/exercise7/index.cfm](/exercise7/index.cfm)) and see if your On Sale Products are displaying. 

For your reference the data from the `getSaleProducts` and `getSaleProductsTotal` methods are used in the following views:

- exercise7/view/includes/home.sale.cfm
- exercise7/view/includes/template.product.cfm
- exercise7/view/sale.cfm

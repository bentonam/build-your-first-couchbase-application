# Exercise 11 - Working with Query Values

---

### Exercise 11.a - Create a Aggregate Reviews View in Couchbase

We need to be able to display the total number of reviews for a given rating of 1 - 5 on the product detail page.

**1\.** Open up the Couchbase Admin Console by going to [http://127.0.0.1:8091/](http://127.0.0.1:8091/) in a web browser

**2\.** Choose [Data Buckets](http://127.0.0.1:8091/index.html#sec=buckets)

**3\.** Click the "[Views](http://127.0.0.1:8091/index.html#sec=views&viewsBucket=default)" button next to the **default** bucket

**4\.** Click the "Development Views" tab, since we already have a Design Document, click the "Add View" button next to `design/dev_products`

**5\.** For the **View Name** use `review_aggregates`

**6\.** Click "Save"

**7\.** Use the following JavaScript as the **Map** function for the view.  This will create a view whose value is a compound key / array of date parts.  The value in the index is *null*.  This will only emit documents to the index that match the following.

a. Has a `doc_type` property with a value of "review"
b. Has a `product_id` property
c. Has a `review_date` property
d. Has a `rating` property
	
```
function ( doc, meta ) {
  if(
    doc.doc_type && 
    doc.doc_type === "review" && 
    doc.product_id && 
    doc.review_date &&
    doc.rating
  ){
    emit( [ doc.product_id, doc.rating ], null );
  }
}
```

**8\.** For the **Reduce** function enter the value of `_count` and click the "Save" button

**9\.** We now need to publish our Development View to Production.  To do this scroll up to the top of the page, and click on [Views](http://127.0.0.1:8091/index.html#sec=views&viewsBucket=default).

**10\.** Make sure you are on the **Development Views** tab and next to `_design/dev_products` click on the "Publish" button.  You will get a notification that the Design Document already exists and it will ask you to confirm that you want to overwrite it, click "Confirm". This will move your `product` Design Document to production and create the index against all of the documents in the entire bucket for all of the views in the view.On Sale

---

### Exercise 11.b - Querying Aggregate Reviews View


**1\.** Open `exercise11/com/example/documents/Product.cfc` in your IDE

**2\.** Modify the `getReviewAggregates` method to query Couchbase View that you created in Exercise 11.a, this will call the CFCouchbase `query()` method with the follow arguments and options:

- designDocumentName = "products"
- viewName = "review_aggregates"
- options:
	- sortOrder = "DESC"
	- reduce = true
	- group = true
	- startKey = [getProduct_ID(), 5]
	- endKey = [getProduct_ID(), 1]

**3\.** Open the homepage ([/exercise11/index.cfm](/exercise11/index.cfm)) and click on any product to visit the Product Detail page, the click on the Reviews Tab and verify that data is being displayed. 

For your reference the data from the `getReviewAggregates` method is used in the following views:

- exercise9/view/includes/product.tabs.reviews.cfm

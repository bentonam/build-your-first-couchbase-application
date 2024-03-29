# Exercise 9 - Compound Keys

---

### Exercise 9.a - Create a Reviews View in Couchbase

We need to be able to display the total number of reviews for a product on the listing pages as well as the product detail page.  

**1\.** Open up the Couchbase Admin Console by going to [http://127.0.0.1:8091/](http://127.0.0.1:8091/) in a web browser

**2\.** Choose [Data Buckets](http://127.0.0.1:8091/index.html#sec=buckets)

**3\.** Click the "[Views](http://127.0.0.1:8091/index.html#sec=views&viewsBucket=default)" button next to the **default** bucket

**4\.** Click the "Development Views" tab, since we already have a Design Document, click the "Add View" button next to `design/dev_products`

**5\.** For the **View Name** use `reviews`

**6\.** Click the "Save" button

**7\.** Use the following JavaScript as the **Map** function for the view.  This will create a view whose value is a compound key / array of date parts.  The value in the index is *null*.  This will only emit documents to the index that match the following.

a. Has a `doc_type` property with a value of "review"
b. Has a `product_id` property
c. Has a `review_date` property
	
```
function ( doc, meta ) {
  if(
    doc.doc_type && 
    doc.doc_type === "review" && 
    doc.product_id && 
    doc.review_date
  ){
    emit( [ doc.product_id, dateToArray( doc.review_date ) ], doc.rating );
  }
}
```

**8\.** For the **Reduce** function enter the value of `_count` and click the "Save" button.  You can click on the "Show Results" button to see partial data from index.

**9\.** We now need to publish our Development View to Production.  To do this scroll up to the top of the page, and click on [Views](http://127.0.0.1:8091/index.html#sec=views&viewsBucket=default).

**10\.** Make sure you are on the **Development Views** tab and next to `_design/dev_products` click on the "Publish" button.  You will get a notification that the Design Document already exists and it will ask you to confirm that you want to overwrite it, click "Confirm". This will move your `product` Design Document to production and create the index against all of the documents in the entire bucket for all of the views in the view.On Sale

---

### Exercise 9.b - Querying the Reviews View to get the Total Reviews

**1\.** Open `exercise9/com/example/documents/Product.cfc` in your IDE

**2\.** Modify the `getReviewTotal` method to query Couchbase View that you created in Exercise 9.a, this will call the CFCouchbase `query()` method with the follow arguments and options:

- designDocumentName = "products"
- viewName = "reviews"
- options:
	- startKey = [getProduct_ID(), utils.getDateParts("1/1/1970")],
	- endKey = [getProduct_ID() & chr(64975), utils.getDateParts("1/1/1970")]
	
For your reference the data from the `getReviewTotal` method is used in the following views:

- exercise9/view/includes/product.info.cfm
- exercise9/view/includes/template.product.cfm


---

### Exercise 9.c - Querying the Reviews View to get the Reviews

We need to display at most 2 reviews on the Product Detail page and then provide the user an option to be able to browse through all of the possible reviews for the product.

**1\.** Open `exercise9/com/example/documents/Product.cfc` in your IDE

**2\.** Modify the `getReviews` method to query Couchbase View that you created in Exercise 9.a, this will call the CFCouchbase `query()` method with the follow arguments and options:

- designDocumentName = "products"
- viewName = "reviews"
- inflateTo = "com.example.documents.Review"
- options:
	- reduce = false
	- sortOrder = "DESC"
	- startKey = [getProduct_ID(), utils.getDateParts(now())]
	- endKey = [getProduct_ID(), utils.getDateParts("1/1/1970")]
	- limit = arguments.limit
	- offset = arguments.offset
	- includeDocs = true
	
**3\.** Open the homepage ([/exercise9/index.cfm](/exercise9/index.cfm)) and click on any product to visit the Product Detail page, the click on the Reviews Tab and verify that data is being displayed. 

For your reference the data from the `getReviews` method is used in the following views:

- exercise9/com/example/documents/Review.cfc
- exercise9/view/includes/product.tabs.cfm
- exercise9/view/includes/product.tabs.reviews.cfm
- exercise9/view/reviews.cfm
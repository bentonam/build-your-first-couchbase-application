# Exercise 10 - Querying with Custom Reduce Functions

---

### Exercise 19.a - Create a Average Reviews View in Couchbase

We need to be able to display the average number of reviews for a product on the listing pages as well as the product detail page.  

**1\.** Open up the Couchbase Admin Console by going to [http://127.0.0.1:8091/](http://127.0.0.1:8091/) in a web browser

**2\.** Choose [Data Buckets](http://127.0.0.1:8091/index.html#sec=buckets)

**3\.** Click the "[Views](http://127.0.0.1:8091/index.html#sec=views&viewsBucket=default)" button next to the **default** bucket

**4\.** Click the "Development Views" tab, since we already have a Design Document, click the "Add View" button next to `design/dev_products`

**5\.** For the **View Name** use `reviews`

**6\.** Click "Save"

**7\.** Use the following JavaScript as the **Map** function for the view.  This will create a view whose value is a compound key / array of date parts.  The value in the index is *null*.  This will only emit documents to the index that match the following.

1. Has a `doc_type` property with a value of "review"
2. Has a `product_id` property
	
```
function (doc, meta) {
  if(
    doc.doc_type && 
    doc.doc_type === "review" && 
    doc.product_id
  ){
    emit(doc.product_id, doc.rating);
  }
}
```
Notice that we are outputting the review rating as the value to the view

**8\.** For the **Reduce** function enter the following JavaScript:

```
function(keys, values, rereduce){
  var sum = values.reduce(
    function(a, b) { 
      return a + b; 
    }
  );
  return Math.round((sum / values.length) * 10) / 10;
}
```

**9\.** Click the "Save" button.  You can click on the "Show Results" button to see partial data from index.

**10\.** We now need to publish our Development View to Production.  To do this scroll up to the top of the page, and click on [Views](http://127.0.0.1:8091/index.html#sec=views&viewsBucket=default).

**11\.** Make sure you are on the **Development Views** tab and next to `_design/dev_products` click on the "Publish" button.  You will get a notification that the Design Document already exists and it will ask you to confirm that you want to overwrite it, click "Confirm". This will move your `product` Design Document to production and create the index against all of the documents in the entire bucket for all of the views in the view.On Sale

---

### Exercise 10.b - Querying Average Reviews View


**1\.** Open `exercise10/com/example/documents/Product.cfc` in your IDE

**2\.** Modify the `getAverageReviewRating` method to query Couchbase View. This will call the CFCouchbase `query()` method with the following arguments:

```
query = cb.query(
	designDocumentName = "products",
	viewName = "reviews_avg_rating",
	options = {
		reduce = true,
		key = getProduct_ID()
	}
);
```

For your reference the data from the `getAverageReviewRating` method is used in the following views:

- exercise9/view/includes/product.info.cfm
- exercise9/view/includes/template.product.cfm

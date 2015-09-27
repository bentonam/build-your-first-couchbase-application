# Exercise 12 - Leveraging a Primary Key View

---

### Exercise 12.a - Create a All Products View in Couchbase

While using the `getMulti` method of CFCouchbase is beneficial, it returns a structure of unordered data.  We can create a view that allows us to achieve the same functionality, but with ordered data.  

**1\.** Open up the Couchbase Admin Console by going to [http://127.0.0.1:8091/](http://127.0.0.1:8091/) in a web browser

**2\.** Choose [Data Buckets](http://127.0.0.1:8091/index.html#sec=buckets)

**3\.** Click the "[Views](http://127.0.0.1:8091/index.html#sec=views&viewsBucket=default)" button next to the **default** bucket

**4\.** Click the "Development Views" tab, since we already have a Design Document, click the "Add View" button next to `design/dev_products`

**5\.** For the **View Name** use `all`

**6\.** Click the "Save" button

**7\.** Use the following JavaScript as the **Map** function for the view.  This will create a view whose value is a compound key / array of date parts.  The value in the index is *null*.  This will only emit documents to the index that match the following.

a. Has a `doc_type` property with a value of "product"
	
```
function ( doc, meta ) {
  if(
    doc.doc_type && 
    doc.doc_type === "product"
  ){
    emit( meta.id, null );
  }
}
```

**8\.** For the **Reduce** function enter the value of `_count` and click the "Save" button

**9\.** We now need to publish our Development View to Production.  To do this scroll up to the top of the page, and click on [Views](http://127.0.0.1:8091/index.html#sec=views&viewsBucket=default).

**10\.** Make sure you are on the **Development Views** tab and next to `_design/dev_products` click on the "Publish" button.  You will get a notification that the Design Document already exists and it will ask you to confirm that you want to overwrite it, click "Confirm". This will move your `product` Design Document to production and create the index against all of the documents in the entire bucket for all of the views in the view.On Sale

---

### Exercise 12.b - Querying the All Products View

On our Product Detail page there is a Related Products tab that will show all of the Related Products for the product being viewed.  These Related products are stored as an array of product_id's on the document. 

**1\.** Open `exercise12/com/example/documents/Product.cfc` in your IDE

**2\.** Modify the `getRelatedProducts` method to query Couchbase View that you created in Exercise 12.a, this will call the CFCouchbase `query()` method with the follow arguments and options:

- designDocumentName = "products"
- viewName = "all"
- inflateTo = "com.example.documents.Product"
- options:
	- reduce = false
	- keys = getRelated()
	- includeDocs = true

**3\.** Open the homepage ([/exercise12/index.cfm](/exercise12/index.cfm)) and click on any product to visit the Product Detail page, the click on the Related Tab and verify that data is being displayed. 

For your reference the data from the `getRelatedProducts` method is used in the following views:

- exercise12/view/includes/product.tabs.cfm
- exercise12/view/includes/product.tabs.related.cfm
- exercise12/view/includes/template.product.cfm

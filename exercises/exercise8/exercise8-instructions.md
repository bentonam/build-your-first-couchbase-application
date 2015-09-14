# Exercise 8 - Inflating Documents to Objects

---

### Exercise 8.a - Create a Slug View in Couchbase

We need to be able to retrieve products from the database with a friendly url string, commonly called a "Slug" instead of a product_id.  We will create an index that will emit the `slug` property for all product documents.

**1\.** Open up the Couchbase Admin Console by going to [http://127.0.0.1:8091/](http://127.0.0.1:8091/) in a web browser

**2\.** Choose [Data Buckets](http://127.0.0.1:8091/index.html#sec=buckets)

**3\.** Click the "[Views](http://127.0.0.1:8091/index.html#sec=views&viewsBucket=default)" button next to the **default** bucket

**4\.** Click the "Development Views" tab, since we already have a Design Document, click the "Add View" button next to `design/dev_products`

**5\.** For the **View Name** use `on_sale`

**6\.** Click the "Save" button

**7\.** Use the following JavaScript as the **Map** function for the view.  This will create a view whose value is a compound key / array of date parts.  The value in the index is *null*.  This will only emit documents to the index that match the following.

a. Has a `doc_type` property with a value of "product"
b. Has a `slug` property

```
function ( doc, meta ) {
  if( 
    doc.doc_type && 
    doc.doc_type === "product" && doc.slug
  ) {
    emit( doc.slug, null );
  }
}
```

**8\.** For the **Reduce** function enter the value of `_count` and click the "Save" button.  You can click on the "Show Results" button to see partial data from index.

**9\.** We now need to publish our Development View to Production.  To do this scroll up to the top of the page, and click on [Views](http://127.0.0.1:8091/index.html#sec=views&viewsBucket=default).

**10\.** Make sure you are on the **Development Views** tab and next to `_design/dev_products` click on the "Publish" button.  You will get a notification that the Design Document already exists and it will ask you to confirm that you want to overwrite it, click "Confirm". This will move your `product` Design Document to production and create the index against all of the documents in the entire bucket for all of the views in the view.On Sale

---

### Exercise 8.b - Querying the Slug View

We can easily represent a JSON Document with a CFC.  This will centralize any logic around a given document.  To do this within a `get()` or `query()` we will use the `inflateTo="path.to.Class"` argument.

**1\.** Open `exercise8/com/example/ProductService.cfc` in your IDE

**2\.** Modify the `getProductBySlug` method to query Couchbase View that you created in Exercise 8.a, this will call the CFCouchbase `query()` method with the follow arguments and options:

- designDocumentName = "products"
- viewName = "by_slug"
- inflateTo = "com.example.documents.Product"
- options:
	- reduce = false
	- key = arguments.slug
	- limit = 1
	- includeDocs = true

**3\.** Open the homepage ([/exercise8/index.cfm](/exercise8/index.cfm)) and click on any product to visit the Product Detail page and verify that data is being displayed. 

For your reference the data from the `getProductBySlug` method is used in the following views:

- exercise/8/com/example/documents/Product.cfc
- exercise8/view/product.cfm
- exercise8/view/includes/product.info.cfm
- exercise8/view/includes/product.images.cfm
- exercise8/view/includes/product.tabs.cfm

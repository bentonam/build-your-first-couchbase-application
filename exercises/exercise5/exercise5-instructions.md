# Exercise 5 - Query Grouping

---

### Exercise 5.a - Querying the Categories View with Grouping

We need to be able to query the `by_category` view that we created in Exercise 4.a to get all of the categories in our bucket, as well as the total number of products in each category.

**1\.** Open `exercise5/com/example/CategoryService.cfc` in your IDE

**2\.** Modify the `getCategories` method to query Couchbase View that you created in Exercise 4.a, this will call the CFCouchbase `query()` method with the follow arguments and options

- designDocumentName = "products"
- viewName = "by_category"
- options:
	- group = true
	
**3\.** Open the homepage ([/exercise5/index.cfm](/exercise5/index.cfm)) and verify that you are seeing categories and their counts in the sidebar.

To enable grouping in the Couchbase Admin Console.  Do the following:

a. Open up the Couchbase Admin Console by going to [http://127.0.0.1:8091/](http://127.0.0.1:8091/) in a web browser
b. Choose [Data Buckets](http://127.0.0.1:8091/index.html#sec=buckets)
c. Click the "[Views](http://127.0.0.1:8091/index.html#sec=views&viewsBucket=default)" button next to the **default** bucket
d. Click the "Edit" button next to the view "by_category"
e. Click the down arrow next to "Filter Results", and check *group* from the drop down menu. (at the bottom)
f. Click the "Show Results" button

For your reference the data from the `getCategories` method is used in the following view:

- exercise5/view/includes/sidebar.categories.cfm

---

### Exercise 5.b - Querying the Brands View with Grouping

We need to be able to query the `by_brand` view that we created in Exercise 4.c to get all of the brands in our bucket, as well as the total number of products in each category.

**1\.** Open `exercise5/com/example/BrandService.cfc` in your IDE

**2\.** Modify the `getBrands` method to query Couchbase View that you created in Exercise 4.c, this will call the CFCouchbase `query()` method with the follow arguments and options

- designDocumentName = "products"
- viewName = "by_brand"
- options:
	- group = true

**3\.** Open the homepage ([/exercise5/index.cfm](/exercise5/index.cfm)) and verify that you are seeing brands and their counts in the sidebar.

To enable grouping in the Couchbase Admin Console.  Do the following:

a. Open up the Couchbase Admin Console by going to [http://127.0.0.1:8091/](http://127.0.0.1:8091/) in a web browser
b. Choose [Data Buckets](http://127.0.0.1:8091/index.html#sec=buckets)
c. Click the "[Views](http://127.0.0.1:8091/index.html#sec=views&viewsBucket=default)" button next to the **default** bucket
d. Click the "Edit" button next to the view "by_brand"
e. Click the down arrow next to "Filter Results", and check *group* from the drop down menu. (at the bottom)
f. Click the "Show Results" button

For your reference the data from the `getBrands` method is used in the following view:

- exercise5/view/includes/sidebar.brands.cfm
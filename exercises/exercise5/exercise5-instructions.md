# Exercise 5 - Query Grouping

---

### Exercise 5.a - Querying the Categories View with Grouping

We need to be able to query the `by_category` view that we created in Exercise 4.a to get all of the categories in our bucket, as well as the total number of products in each category.

Open `exercise5/com/example/CategoryService.cfc` in your IDE

Modify the `getCategories` method to query Couchbase View, this will take a single option of `group` that is set to *true*

For your reference the data from the `getCategories` method is used in the following view:

- exercise5/view/includes/sidebar.categories.cfm

---

### Exercise 5.b - Querying the Brands View with Grouping

We need to be able to query the `by_brand` view that we created in Exercise 4.c to get all of the brands in our bucket, as well as the total number of products in each category.

Open `exercise5/com/example/BrandService.cfc` in your IDE

Modify the `getBrands` method to query Couchbase View, this will take a single option of `group` that is set to *true*

For your reference the data from the `getBrands` method is used in the following view:

- exercise5/view/includes/sidebar.brands.cfm
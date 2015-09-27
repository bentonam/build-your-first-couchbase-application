# Exercise 2 - Static Documents for Site Config

---

### Exercise 2.a - Update the Site Config Document

**1\.** Open the Couchbase Admin Console by going to [http://127.0.0.1:8091/](http://127.0.0.1:8091/) in a web browser

**2\.** Choose [Data Buckets](http://127.0.0.1:8091/index.html#sec=buckets)

**3\.** Choose [Documents](http://127.0.0.1:8091/index.html#sec=documents&viewsBucket=default&documentsPageNumber=0&documentsFilter=inclusive_end%3Dfalse) next to the **default** bucket

**4\.** Type in `site_config` for the Document ID

**5\.** Click the "Lookup" button

**6\.** Edit the JSON structure to contain different values than those provided

**7\.** Click the "Save" button

---

### Exercise 2.b - Retrieve the Site Config Document

**1\.** Open `exercise2/com/example/SiteService.cfc` in your IDE

**2\.** Modify the `getSiteConfig` retrieve the `site_config` document by calling the CFCouchbase `get()` method with the following arguments:

```
config = cb.get(id="site_config");
```

**3\.** Open the homepage ([/exercise2/index.cfm](/exercise2/index.cfm)) and verify that your new site config values are being displayed

For your reference the data from the `getSiteConfig` method is used in the following views:

- exercise2/view/layout/layout.main.cfm
- exercise2/view/layout/layout.header.cfm

---

### Exercise 2.c - Retrieve the Categories Config Document

**1\.** Open `exercise2/com/example/CategoryService.cfc` in your IDE

**2\.** Modify the `getCategories` method to retrieve the `categories` document by calling the CFCouchbase `get()` method passing the argument of `"categories"`, assigned to the `doc` variable and return the resulting structures categories array property.  The document is structured as follows:

```
{
    "doc_type": "config",
    "categories": [
        {
            "slug": "books-and-audible",
            "name": "Books & Audible"
        },
        {
            "slug": "movies-music-and-games",
            "name": "Movies, Music & Games"
        },
        ...
    ]
}
```

**3\.** Open the homepage ([/exercise2/index.cfm](/exercise2/index.cfm)) and verify that the categories are being displayed

For your reference the data from the `getCategories` method is used in the following views:

- exercise2/view/layout/layout.header.cfm
- exercise2/view/includes/sidebar.categories.cfm

---

### Exercise 2.d - Retrieve the Brands Config Document

**1\.** Open `exercise2/com/example/BrandService.cfc` in your IDE

**2\.** Modify the `getBrands` method to retrieve the `brands` document by calling the CFCouchbase `get()` method passing the argument of `"brands"`, assigned to a the `doc` variable and return the resulting structures brands array property.  The document is structured as follows:

```
{
	"doc_type": "config",
	"brands": [
		{
			"slug": "philips",
			"name": "Philips"
		},
		{
			"slug": "apple",
			"name": "Apple"
		},
		...
	]
}
```

**3\.** Open the homepage ([/exercise2/index.cfm](/exercise2/index.cfm)) and verify that brands are being displayed

For your reference the data from the `getBrands` method is used in the following views:

- exercise2/view/layout/layout.header.cfm
- exercise2/view/includes/sidebar.brands.cfm

---

### Exercise 2.e - Retrieve the Banners Config Document

**1\.** Open `exercise2/com/example/SiteService.cfc` in your IDE

**2\.** Modify the `getHomepageBanners` method to retrieve the `banners` document by calling the CFCouchbase `get()` method passing the argument of `"banners"`, assigned to the `doc` variable and return the resulting structures banners array property.  The document is structured as follows:

```
{
	"doc_type": "config",
	"banners": [
		{
			"name": "Product Ad 1",
			"image": "http://lorempixel.com/800/300/sports/?r=111111111",
			"url": "##"
		},
		{
			"name": "Product Ad 2",
			"image": "http://lorempixel.com/800/300/sports/?r=222222222",
			"url": "##"
		},
		{
			"name": "Product Ad 3",
			"image": "http://lorempixel.com/800/300/sports/?r=333333333",
			"url": "##"
		}
	]
}
```

**3\.** Open the homepage ([/exercise2/index.cfm](/exercise2/index.cfm)) and verify that banners are being displayed

For your reference the data from the `getHomepageBanners` method is used in the following views:

- exercise2/view/includes/home.banners.cfm
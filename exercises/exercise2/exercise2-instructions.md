# Exercise 2 - Static Documents for Site Config

---

### Exercise 2.a - Create a Site Config Document

1. Open the Couchbase Admin Console by going to [http://127.0.0.1:8091/](http://127.0.0.1:8091/) in a web browser
2. Choose [Data Buckets](http://127.0.0.1:8091/index.html#sec=buckets)
3. Choose [Documents](http://127.0.0.1:8091/index.html#sec=documents&viewsBucket=default&documentsPageNumber=0&documentsFilter=inclusive_end%3Dfalse) next to the **default** bucket
4. Choose "Create Document"
5. Use `site_config` for the Document ID
6. Click "Create"
7. Create the following JSON structure, and click "Save"

```
{
  "doc_type": "config",
  "seo_title": "Build Your First Couchbase Application",
  "site_name": "Company Name"
}
```

---

### Exercise 2.b - Retreive the Site Config Document

Open `exercise2/com/example/SiteService.cfc` in your IDE

Modify the `getSiteConfig` method to retrieve the `site_config` document created in 2.a by calling the CFCouchbase `get()` method and return the resulting structure.

For your reference the data from the `getSiteConfig` method is used in the following views:

- exercise2/view/layout/layout.main.cfm
- exercise2/view/layout/layout.header.cfm

---

### Exercise 2.c - Retreive the Categories Config Document

Open `exercise2/com/example/SiteService.cfc` in your IDE

Modify the `getSiteCategories` method to retrieve the `categories` document and return just the array `categories` property of the document.  The document is structured as follows:

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

For your reference the data from the `getSiteCategories` method is used in the following views:

- exercise2/view/layout/layout.header.cfm
- exercise2/view/includes/sidebar.categories.cfm

---

### Exercise 2.d - Retreive the Brands Config Document

Open `exercise2/com/example/SiteService.cfc` in your IDE

Modify the `getSiteBrands` method to retrieve the `brands` document and return just the array `brands` property of the document.  The document is structured as follows:

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

For your reference the data from the `getSiteBrands` method is used in the following views:

- exercise2/view/layout/layout.header.cfm
- exercise2/view/includes/sidebar.brands.cfm

---

### Exercise 2.e - Retreive the Brands Config Document

Open `exercise2/com/example/SiteService.cfc` in your IDE

Modify the `getHomepageBanners` method to retrieve the `banners` document and return just the array `banners` property of the document.  The document is structured as follows:

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

For your reference the data from the `getHomepageBanners` method is used in the following views:

- exercise2/view/includes/home.banners.cfm
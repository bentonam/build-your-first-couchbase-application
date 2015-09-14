# Exercise 13 - Introduction to Elasticsearch

---

### Exercise 13.a - Install and Setup Elasticsearch

**1\.** Install elastic search

**Mac**

If you have homebrew, run: 

`brew install elasticsearch`

**Windows**

a. Unzip the elasticsearch-1.7.1.zip file
b. Copy the contents to wherever you want on your system

**2\.** Start the Elasticsearch Server

**Mac**

`elasticsearch --config=/usr/local/opt/elasticsearch/config/elasticsearch.yml`

**Windows**

a. Change into the bin directory `cd elasticsearch-1.7.1/bin` 
b. Run the `elasticsearch.bat`

**3\.** After it has finished starting up, stop the Elasticsearch Server by pressing `Ctrl + C`

**4\.** Change to the Elasticsearch directory

`cd /usr/local/opt/elasticsearch/`

**5\.** Install the Couchbase Elasticsearch plugin

```
bin/plugin -install transport-couchbase -url \
http://packages.couchbase.com.s3.amazonaws.com/releases/elastic-search-adapter/2.0.0/elasticsearch-transport-couchbase-2.0.0.zip
```

**6\.** Set the username and password for the plugin

```
echo "couchbase.password: password" >> config/elasticsearch.yml ; echo "couchbase.username: Administrator" >> config/elasticsearch.yml
```

If this fails you can manually add the entry by editing the `elasticsearch/config/elasticsearch.yml` file and add the following entries at the bottom of the file:

```
couchbase.password: password
couchbase.username: Administrator
```

**7\.** Install the ElasticSearch Head Plugin to provide a web interface to ElasticSearch.

`bin/plugin -install mobz/elasticsearch-head`

**8\.** Start the Elasticsearch server

**Mac**

`bin/elasticsearch`

**Windows**

a. Change into the bin directory `cd elasticsearch-1.7.1/bin` 
b. Run the `elasticsearch.bat`

**9\.** Verify the install by opening up the web interface [http://localhost:9200/_plugin/head/](http://localhost:9200/_plugin/head/)

**10\.** Create a New Index / Bucket in Elasticsearch by clicking "Indicies"

**11\.** Click the "New Index" button

**12\.** Use `example-site` for the Index Name, leave the other fields as the default. 

**13\.** Click the "OK" button

---

### 13.b - Create a New Couchbase Cluster Reference

Couchbase will replicate data to a remote Couchbase Cluster, in this case Elasticsearch is our remote Couchbase Cluster.  

**1\.** Go to the [XDCR](http://127.0.0.1:8091/index.html#sec=replications) tab

**2\.** Click "Create Cluster Reference"

**3\.** Enter a name for the cluster reference i.e. "Elasticsearch"

**4\.** Enter "127.0.0.1:9091" for the IP/hostname

**5\.** Enter the **value** for `couchbase.username` (i.e. "Administrator") that provided 
earlier when setting up the plugin as the Username

**6\.** Enter the **value** for `couchbase.password` (i.e. "password") that provided earlier when setting up the plugin as the Password

**7\.** Click the "Save" button

---

### 13.c - Create a New Couchbase Replication

Couchbase will feed data to Elasticsearch through its built in Replication mechanism, XDCR.  To Couchbase, Elasticsearch is nothing more than another replication of a bucket. 

**1\.** From the [XDCR](http://127.0.0.1:8091/index.html#sec=replications) tab click "Create Replication"

**2\.** Select the bucket from your initial setup i.e. "default"

**3\.** Choose the cluster from the previous steps i.e. "Elasticsearch"

**3\.** Enter in the name of the Elasticsearch Index / Bucket you provided in **13a. 12** i.e. "example-site"

**4\.** Click "Advanced Settings" link

**5\.**  Change the XDCR Protocol to "Version 1"

**6\.** Click the "Replicate" button

You should see the status of the replication as "Replicating".  If you open up the Elasticsearch web interface [http://localhost:9200/_plugin/head/](http://localhost:9200/_plugin/head/) and refresh you should see the number of docs going up.

---

### 13.d - Calling Elasticsearch for Searching of Products

A search function is a necessary feature of every ecommerce website.  We need to be able to search all of our products and this is something Elasticsearch does very well.  

**1\.** Open `exercise13/com/example/documents/SearchService.cfc` in your IDE

**2\.** Modify the `getProductsBySearch` method to perform an HTTP Request to Elasticsearch.

```
http = new Http();
http.setUrl(elasticsearch_url);
http.setMethod("GET");
http.setTimeout(10);
http_result = http.send().getPrefix();
```

**3\.** Open the homepage ([/exercise13/index.cfm](/exercise13/index.cfm)) and search for products to verify the Elasticsearch integration. 

For your reference the data from the `getProductsBySearch` method is used in the following views:

- exercise13/com/example/documents/Product.cfc
- exercise13/view/search.cfm
- exercise13/view/includes/template.product.cfm

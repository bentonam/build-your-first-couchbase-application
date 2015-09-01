# Exercise 1 - Working with Couchbase Documents

---

### Exercise 1.a

In your Terminal change directories to the `build-your-first-couchbase-application/exercises/`

Start a Lucee server by running `box server start`

This will launch your default web browser with the `exercises` directory as the root.  Click on [Exercise 1 - Working with Couchbase Documents](#)

Browse around the site and look at all of the different sections that you will be creating

---

### Exercise 1.b

As with any database we need to make a connection to the database.  With couchbase we will create a connection the the `default` bucket and maintain that connection in the application scope. 

Add the following code to the `onRequestStart` method in `Application.cfc`

	// create a connection to the default bucket if it does not already exist
	if(!structKeyExists(application, "couchbase")){
		application['couchbase'] = new cfcouchbase.CouchbaseClient({
			'servers' = ["http://127.0.0.1:8091"],
			'bucketName' = "default"
		});
	}
	
We need to make sure that when our application is shutting down that we close the connections to the Couchbase bucket at the same time.  Add the following to the `onApplicationEnd` method in `Application.cfc`

	// if the couchbase connection is present close it's connections
	if(structKeyExists(arguments.appScope, "couchbase")){
		application.couchbase.shutdown( 10 );
	}
	
### Exercise 1.c

Now that you have made a connection to `default` bucket on your Couchbase Server.  

Lets create and retrieve some documents.  Navigate to [/exercises/exercise1/console.cfm](/exercises/exercise1/console.cfm) in your browser.  

Document ID's should be all lowercase, with only letters, numbers, underscoes, dashes and colons with a maximum length of 256 characters.  The document content must be valid JSON.

### Exercise 1.d

Before building the rest of our site we need to populate our default bucket with some data.  

In your Terminal change directories to the Couchbase server directory

**Mac OS X**

```
cd /Applications/Couchbase Server.app/Contents/Resources/couchbase-core/bin
```

**Windows**

```
C:\Program Files\Couchbase\Server\bin
```

Import / Restore the database.  Replace `[FULL_PATH_TO_FILES]` with the directory that you copied the files into.

**Mac OS X**

```
./cbrestore ~/[FULL_PATH_TO_FILES]/build-your-first-couchbase-application/data/backup/ http://127.0.0.1:8091 --bucket-source default
```

**Windows**

```
cbrestore C:\[FULL_PATH_TO_FILES]\build-your-first-couchbase-application\data\backup\ http://127.0.0.1:8091 --bucket-source default
```

Verify that the data was imported by going to the Couchbase Server Admin Console [http://127.0.0.1:8091/](http://127.0.0.1:8091/) and browse to [Data Buckets](http://127.0.0.1:8091/index.html#sec=buckets).  You should see 149,270 documents in the default bucket.
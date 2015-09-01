component{
	/*
	* Init
	*/
	public ProductService function init(){
		return this;
	}
	/*
	* Gets recently available products
	* @limit The maximum number of results to return
	* @offset The position to start returning results at
	*/
	public struct function getRecentProducts(numeric limit=25, numeric offset=0){
		var cb = application.couchbase;
		var data = {};
		var total = [];
		var query = [];
		var utils = new root.final.com.benton.Utils();
		try{
			// get the total number of results
			total = cb.query(
				designDocumentName = "products",
				viewName = "recent",
				inflateTo="root.final.com.benton.documents.Product",
				options = {
					reduce = true,
					startKey = utils.getDateParts(now())
				}
			);
			// set the total number of documents matching the query
			data['total'] = arrayLen(total) ? total[1].value : 0;
			// run the query
			query = cb.query(
				designDocumentName = "products",
				viewName = "recent",
				inflateTo="root.final.com.benton.documents.Product",
				options = {
					reduce = false,
					startKey = utils.getDateParts(now()),
					limit = arguments.limit,
					offset = arguments.offset,
					includeDocs = true
				}
			);
			// set the results
			data['results'] = query;
			// set the number of results returned by the query
			data['count'] = arrayLen(data.results);
		}
		catch(any e){
			data['total'] = 0;
			data['results'] = [];
			data['count'] = 0;
		}
		return data;
	}
	/*
	* Gets the on sale products
	* @limit The maximum number of results to return
	* @offset The position to start returning results at
	*/
	public struct function getSaleProducts(numeric limit=25, numeric offset=0){
		var cb = application.couchbase;
		var data = {};
		var total = [];
		var query = [];
		var utils = new root.final.com.benton.Utils();
		try{
			// get the total number of results
			total = cb.query(
				designDocumentName = "products",
				viewName = "on_sale",
				inflateTo="root.final.com.benton.documents.Product",
				options = {
					reduce = true,
					startKey = utils.getDateParts(now())
				}
			);
			// set the total number of documents matching the query
			data['total'] = arrayLen(total) ? total[1].value : 0;
			// run the query
			query = cb.query(
				designDocumentName = "products",
				viewName = "on_sale",
				inflateTo="root.final.com.benton.documents.Product",
				options = {
					reduce = false,
					startKey = utils.getDateParts(now()),
					limit = arguments.limit,
					offset = arguments.offset,
					includeDocs = true
				}
			);
			// set the results
			data['results'] = query;
			// set the number of results returned by the query
			data['count'] = arrayLen(data.results);
		}
		catch(any e){
			data['total'] = 0;
			data['results'] = [];
			data['count'] = 0;
		}
		return data;
	}
	/*
	* Gets gets products by the category name
	* @category The Category to get the products for
	* @limit The maximum number of results to return
	* @offset The position to start returning results at
	*/
	public struct function getProductsByCategory(required string category, numeric limit=25, numeric offset=0){
		var cb = application.couchbase;
		var data = {};
		var total = [];
		var query = [];
		var utils = new root.final.com.benton.Utils();
		try{
			// get the total number of results
			total = cb.query(
				designDocumentName = "products",
				viewName = "by_category",
				inflateTo="root.final.com.benton.documents.Product",
				options = {
					reduce = true,
					key = arguments.category
				}
			);
			// set the total number of documents matc
			data['total'] = arrayLen(total) ? total[1].value : 0;
			// run the query
			query = cb.query(
				designDocumentName = "products",
				viewName = "by_category",
				inflateTo="root.final.com.benton.documents.Product",
				options = {
					reduce = false,
					key = arguments.category,
					limit = arguments.limit,
					offset = arguments.offset,
					includeDocs = true
				}
			);
			// set the results
			data['results'] = query;
			// set the number of results returned by the query
			data['count'] = arrayLen(data.results);
		}
		catch(any e){
			data['total'] = 0;
			data['results'] = [];
			data['count'] = 0;
		}
		return data;
	}
	/*
	* Gets products by the category name
	* @brand The Brand to get the products for
	* @limit The maximum number of results to return
	* @offset The position to start returning results at
	*/
	public struct function getProductsByBrand(required string brand, numeric limit=25, numeric offset=0){
		var cb = application.couchbase;
		var data = {};
		var total = [];
		var query = [];
		var utils = new root.final.com.benton.Utils();
		try{
			// get the total number of results
			total = cb.query(
				designDocumentName = "products",
				viewName = "by_brand",
				inflateTo="root.final.com.benton.documents.Product",
				options = {
					reduce = true,
					key = arguments.brand
				}
			);
			// set the total number of documents matc
			data['total'] = arrayLen(total) ? total[1].value : 0;
			// run the query
			query = cb.query(
				designDocumentName = "products",
				viewName = "by_brand",
				inflateTo="root.final.com.benton.documents.Product",
				options = {
					reduce = false,
					key = arguments.brand,
					limit = arguments.limit,
					offset = arguments.offset,
					includeDocs = true
				}
			);
			// set the results
			data['results'] = query;
			// set the number of results returned by the query
			data['count'] = arrayLen(data.results);
		}
		catch(any e){
			data['total'] = 0;
			data['results'] = [];
			data['count'] = 0;
		}
		return data;
	}
	/*
	* Performs a search against Elastic to get results
	* @keyword The keyword to search on
	* @limit The maximum number of results to return
	* @offset The position to start returning results at
	*/
	public struct function getProductsBySearch(required string keyword, numeric limit=25, numeric offset=0){
		var data = {};
		var utils = new root.final.com.benton.Utils();
		var elasticsearch_url = "http://127.0.0.1:9200/demo-site/_search/";
		var query = "";
		try{
			// clean the search term
			query = replace(arguments.keyword, "*", "", "all");
			// default outputs
			data['total'] = 0;
			data['results'] = [];
			data['count'] = 0;
			if(len(trim(query))){
				// perform the http post
				http = new Http();
				http.setUrl(elasticsearch_url & "?start=" & arguments.offset & "&size=" & arguments.limit & "&q=couchbaseDocument.doc.doc_type:product AND couchbaseDocument.doc.availability:In-Stock AND _all:*" & arguments.keyword & "*");
				http.setMethod("GET");
				http.setTimeout(10);
				http_result = http.send().getPrefix();
				// parse the results
				if(http_result.status_code == 200 && isJSON(http_result.fileContent)){
					results = deserializeJSON(http_result.fileContent);
					data['total'] = results.hits.total;
					data['count'] = arrayLen(results.hits.hits);
					data['results'] = [];
					// transform the elastic search response into the same format as our couchbase queries
					for(var i = 1; i <= data.count; i++){
						data['results'][i] = {};
						data['results'][i]['id'] = results.hits.hits[i]._id;
						data['results'][i]['score'] = results.hits.hits[i]._score;
						// create the product handle
						data['results'][i]['document'] = new root.final.com.benton.documents.Product();
						// inflate all of the data from elasticsearch to the properties of the handle
						data.results[i].document.inflate(results.hits.hits[i]._source.doc);
					}
				}
			}
		}
		catch(any e){
			data['total'] = 0;
			data['results'] = [];
			data['count'] = 0;
		}
		return data;
	}
	/*
	* Gets a single product by the slug
	* @slug The slug of the product
	*/
	public struct function getProductBySlug(required string slug){
		var cb = application.couchbase;
		var data = {};
		try{
			data['found'] = false;
			// run the query
			query = cb.query(
				designDocumentName = "products",
				viewName = "by_slug",
				inflateTo="root.final.com.benton.documents.Product",
				options = {
					reduce = false,
					key = arguments.slug,
					limit = 1,
					includeDocs = true
				}
			);
			if(arrayLen(query)){
				data['document'] = query[1].document;
				data['found'] = true;
			}
		}
		catch(any e){
			data['found'] = false;
		}
		return data;
	}
}
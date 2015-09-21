component{
	/*
	* Init
	*/
	public com.example.SearchService function init(){
		return this;
	}

	/**
	* Performs a search query against Elasticsearch to get relevant products
	* @keyword The keyword to search on
	* @limit The maximum number of results to return
	* @offset The position to start returning results at
	*/
	public struct function getProductsBySearch(required string keyword, numeric limit=24, numeric offset=0){
		var data = {};
		var http = "";
		var http_result = {};
		var elasticsearch_url = "http://127.0.0.1:9200/example-site/_search/";
		var query_term = replace(arguments.keyword, "*", "", "all"); // clean the search term
		// default outputs
		data['total'] = 0;
		data['results'] = [];
		data['count'] = 0;
		if(len(trim(query_term))){
			// set the starting / offset position
			elasticsearch_url &= "?start=" & arguments.offset;
			// set the size / limit for the number of results to return
			elasticsearch_url &= "&size=" & arguments.limit;
			// set the standard document filters
			elasticsearch_url &= "&q=couchbaseDocument.doc.doc_type:product AND couchbaseDocument.doc.availability:In-Stock";
			// set the search term to query all fields
			elasticsearch_url &= " AND _all:*" & query_term & "*";
// start of exercise 13.d ------------------------------------------------------------------
			// perform the http request to elasticsearch

// end of exercise 13.d --------------------------------------------------------------------
			// parse the results
			if(http_result.status_code == 200 && isJSON(http_result.fileContent)){
				results = deserializeJSON(http_result.fileContent);
				data['total'] = results.hits.total;
				data['count'] = arrayLen(results.hits.hits);
				data['results'] = [];
				// transform the elastic search response into the same format as our couchbase queries
				// where each result is inflated into our com.example.documents.Product.cfc
				for(var i = 1; i <= data.count; i++){
					data['results'][i] = {};
					data['results'][i]['id'] = results.hits.hits[i]._id;
					data['results'][i]['score'] = results.hits.hits[i]._score;
					// create the product handle
					data['results'][i]['document'] = new com.example.documents.Product();
					// inflate all of the data from Elasticsearch to the properties of the handle
					// note that the inflate() method is simply a custom convenience method
					data.results[i].document.inflate(results.hits.hits[i]._source.doc);
				}
			}
		}
		//dump(var=http_result, label="http_result"); dump(var=data, label="data"); abort;
		return data;
	}
}
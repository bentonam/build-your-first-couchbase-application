component{
	/*
	* Init
	*/
	public ProductService function init(){
		variables['utils'] = new com.example.Utils();
		return this;
	}

	/**
	* Gets recently available products for the homepage
	* @limit The maximum number of results to return
	* @offset The position to start returning results at
	*/
	public array function getRecentProducts(numeric limit=24, numeric offset=0){
		var cb = application.couchbase;
		var recent_products = {};
		var query = [];
// start of exercise 7.b ------------------------------------------------------------------

// end of exercise 7.b --------------------------------------------------------------------
		//dump(query); abort;
		return query;
	}

	/**
	* Gets the total number of recent products
	*/
	public numeric function getRecentProductsTotal(){
		var cb = application.couchbase;
		var total = 0;
		var query = [];
// start of exercise 7.c ------------------------------------------------------------------
		// execute the query to get the total of products on sale
		query = cb.query(
			designDocumentName = "products",
			viewName = "recent",
			options = {
				reduce = true,
				startKey = variables.utils.getDateParts(now())
			}
		);
// end of exercise 7.c --------------------------------------------------------------------
		// set the total number of documents on sale
		total = arrayLen(query) ? query[1].value : 0;
		//dump(var=query, label="query"); dump(var=total, label="total"); abort;
		return total;
	}

	/**
	* Gets the on sale products
	* @limit The maximum number of results to return
	* @offset The position to start returning results at
	*/
	public array function getSaleProducts(numeric limit=24, numeric offset=0){
		var cb = application.couchbase;
		var total = [];
		var query = [];
// start of exercise 7.e --------------------------------------------------------------------
		// execute the query to get the products in the category
		query = cb.query(
			designDocumentName = "products",
			viewName = "on_sale",
			options = {
				reduce = false,
				limit = arguments.limit,
				offset = arguments.offset,
				includeDocs = true
			}
		);
// end of exercise 7.e --------------------------------------------------------------------
		//dump(var=query, label="query"); abort;
		return query;
	}

	/**
	* Gets the total number of products on sale
	*/
	public numeric function getSaleProductsTotal(){
		var cb = application.couchbase;
		var total = 0;
		var query = [];
		var utils = new com.example.Utils();
// start of exercise 7.e ------------------------------------------------------------------
		// execute the query to get the total of products on sale
		query = cb.query(
			designDocumentName = "products",
			viewName = "on_sale"
		);
// end of exercise 7.e --------------------------------------------------------------------
		// set the total number of documents on sale
		total = arrayLen(query) ? query[1].value : 0;
		//dump(var=query, label="query"); dump(var=total, label="total"); abort;
		return total;
	}
}
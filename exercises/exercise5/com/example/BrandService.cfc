component{
	/*
	* Init
	*/
	public com.example.BrandService function init(){
		return this;
	}

	/**
	* Gets all of the currently used brands on the site and their counts
	*/
	public array function getBrands(){
		var cb = application.couchbase;
		var query = [];
// start of exercise 5.b --------------------------------------------------------------------

// end of exercise 5.b --------------------------------------------------------------------
		return query;
	}

	/**
	* Gets the total number of products for a Brand
	* @brand The Brand to get the product total for
	*/
	public numeric function getProductsTotalForBrand(required string brand){
		var cb = application.couchbase;
		var total = 0;
		var query = [];
// start of exercise 4.d ------------------------------------------------------------------
		// execute the query to get the total number of products in the brand
		query = cb.query(
			designDocumentName = "products",
			viewName = "by_brand",
			options = {
				reduce = true,
				key = arguments.brand
			}
		);
// end of exercise 4.d --------------------------------------------------------------------
		// set the total number of documents in the brand
		total = arrayLen(query) ? query[1].value : 0;
		//dump(var=query, label="query"); dump(var=total, label="total"); abort;
		return total;
	}

	/**
	* Gets products in a given Brand
	* @brand The Brand to get the products for
	* @limit The maximum number of results to return
	* @offset The position to start returning results at
	*/
	public array function getProductsByBrand(required string brand, numeric limit=25, numeric offset=0){
		var cb = application.couchbase;
		var total = [];
		var query = [];
// start of exercise 4.b --------------------------------------------------------------------
		// execute the query to get the products in the brand
		query = cb.query(
			designDocumentName = "products",
			viewName = "by_brand",
			options = {
				reduce = false,
				includeDocs = true,
				key = arguments.brand,
				limit = arguments.limit,
				offset = arguments.offset
			}
		);
// end of exercise 4.b --------------------------------------------------------------------
		// dump(var=query, label="query"); abort;
		return query;
	}
}
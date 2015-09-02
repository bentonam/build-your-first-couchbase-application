component{
	/*
	* Init
	*/
	public CategoryService function init(){
		return this;
	}

	/**
	* Gets all of the currently used brands on the site
	*/
	public array function getCategories(){
		var cb = application.couchbase;
		var doc = {};
		var categories = [];
// start of exercise 2.b ------------------------------------------------------------------
		doc = cb.get(id="categories");
// end of exercise 2.b --------------------------------------------------------------------
		categories = doc.categories;
		//dump(brands); abort;
		return categories;
	}

	/**
	* Gets the total number of products for a Category
	* @brand The Category to get the product total for
	*/
	public numeric function getProductsTotalForCategory(required string category){
		var cb = application.couchbase;
		var total = 0;
		var query = [];
// start of exercise 4.b ------------------------------------------------------------------
		// execute the query to get the total number of products in the category

// end of exercise 4.b --------------------------------------------------------------------
		// set the total number of documents in the category
		total = arrayLen(query) ? query[1].value : 0;
		//dump(var=query, label="query"); dump(var=total, label="total"); abort;
		return total;
	}

	/**
	* Gets products in a given Category
	* @category The Category to get the products for
	* @limit The maximum number of results to return
	* @offset The position to start returning results at
	*/
	public array function getProductsByCategory(required string category, numeric limit=25, numeric offset=0){
		var cb = application.couchbase;
		var total = [];
		var query = [];
// start of exercise 4.b --------------------------------------------------------------------
		// execute the query to get the products in the category

// end of exercise 4.b --------------------------------------------------------------------
		// dump(var=query, label="query"); abort;
		return query;
	}
}
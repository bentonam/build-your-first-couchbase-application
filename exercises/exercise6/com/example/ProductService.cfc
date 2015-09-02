component{
	/*
	* Init
	*/
	public ProductService function init(){
		return this;
	}

	/*
	* Gets recently available products for the homepage
	*/
	public struct function getRecentProducts(){
		var cb = application.couchbase;
		var recent_products = {};
		var products = [];
// start of exercise 3.a ------------------------------------------------------------------
		// get the recent_products document
		recent_products = cb.get(id="recent_products");
		// get all of the keys from recent_products
		products = cb.getMulti(id=recent_products.products);
// end of exercise 3.a --------------------------------------------------------------------
		//dump(products); abort;
		return products;
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
// start of exercise 6.b --------------------------------------------------------------------
		// execute the query to get the products in the category

// end of exercise 6.b --------------------------------------------------------------------
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
// start of exercise 6.c ------------------------------------------------------------------
		// execute the query to get the total of products on sale

// end of exercise 6.c --------------------------------------------------------------------
		// set the total number of documents on sale
		total = arrayLen(query) ? query[1].value : 0;
		//dump(var=query, label="query"); dump(var=total, label="total"); abort;
		return total;
	}
}
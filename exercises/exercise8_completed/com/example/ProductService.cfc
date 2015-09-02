component{
	/*
	* Init
	*/
	public ProductService function init(){
		variables['utils'] = new root.exercise8_completed.com.example.Utils();
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
		query = cb.query(
			designDocumentName = "products",
			viewName = "recent",
			options = {
				reduce = false,
				startKey = variables.utils.getDateParts(now()),
				limit = arguments.limit,
				offset = arguments.offset,
				includeDocs = true
			}
		);
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
				startKey = variables.utils.getDateParts("1/1/1970"),
				endKey = variables.utils.getDateParts(now()),
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
		var utils = new root.exercise8_completed.com.example.Utils();
// start of exercise 7.e ------------------------------------------------------------------
		// execute the query to get the total of products on sale
		query = cb.query(
			designDocumentName = "products",
			viewName = "on_sale",
			options = {
				startKey = variables.utils.getDateParts("1/1/1970"),
				endKey = variables.utils.getDateParts(now())
			}
		);
// end of exercise 7.e --------------------------------------------------------------------
		// set the total number of documents on sale
		total = arrayLen(query) ? query[1].value : 0;
		//dump(var=query, label="query"); dump(var=total, label="total"); abort;
		return total;
	}

	/**
	* Gets a single product by the slug
	* @slug The slug of the product
	*/
	public struct function getProductBySlug(required string slug){
		var cb = application.couchbase;
		var query = [];
		var product = {};
// start of exercise 8.b ------------------------------------------------------------------
		// execute the query to get the product by the slug
		query = cb.query(
			designDocumentName = "products",
			viewName = "by_slug",
			inflateTo="root.exercise8_completed.com.example.documents.Product",
			options = {
				reduce = false,
				key = arguments.slug,
				limit = 1,
				includeDocs = true
			}
		);
// start of exercise 8.b ------------------------------------------------------------------
		if(arrayLen(query)){
			product = query[1];
		}
		//dump(query); dump(product); abort;
		return product;
	}
}
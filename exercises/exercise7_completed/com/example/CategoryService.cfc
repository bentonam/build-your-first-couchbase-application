component{
	/*
	* Init
	*/
	public CategoryService function init(){
		return this;
	}
	/*
	* Gets the total number of products for a Category
	* @brand The Category to get the product total for
	*/
	public numeric function getProductsTotalForCategory(required string category){
		var cb = application.couchbase;
		var total = 0;
		var query = [];
// start of exercise 4.b ------------------------------------------------------------------
		// execute the query to get the total number of products in the category
		query = cb.query(
			designDocumentName = "products",
			viewName = "by_category",
			options = {
				key = arguments.category
			}
		);
// end of exercise 4.b --------------------------------------------------------------------
		// set the total number of documents in the category
		total = arrayLen(query) ? query[1].value : 0;
		//dump(var=query, label="query"); dump(var=total, label="total"); abort;
		return total;
	}
	/*
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
		query = cb.query(
			designDocumentName = "products",
			viewName = "by_category",
			options = {
				reduce = false,
				includeDocs = true,
				key = arguments.category,
				limit = arguments.limit,
				offset = arguments.offset
			}
		);
// end of exercise 4.b --------------------------------------------------------------------
		// dump(var=query, label="query"); abort;
		return query;
	}
	/*
	* Gets all of the currently used categories on the site and their counts
	*/
	public array function getCategories(){
		var cb = application.couchbase;
		var query = [];
// start of exercise 5.a --------------------------------------------------------------------
		// execute the query to get each category and its totals
		query = cb.query(
			designDocumentName = "products",
			viewName = "by_category",
			options = {
				group = true
			}
		);
// end of exercise 5.a --------------------------------------------------------------------
		return query;
	}
}
component{
	/*
	* Init
	*/
	public com.example.CategoryService function init(){
		return this;
	}

	/*
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
}
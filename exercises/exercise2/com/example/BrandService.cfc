component{
	/*
	* Init
	*/
	public BrandService function init(){
		return this;
	}
	/*
	* Gets all of the currently used brands on the site
	*/
	public array function getBrands(){
		var cb = application.couchbase;
		var doc = {};
		var brands = [];
// start of exercise 2.c ------------------------------------------------------------------

// end of exercise 2.c --------------------------------------------------------------------
		brands = doc.brands;
		//dump(brands); abort;
		return brands;
	}
}
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
		var products = {};
// start of exercise 3.a ------------------------------------------------------------------
		// get the recent_products document
		recent_products = cb.get(id="recent_products");
		// get all of the keys from recent_products
		products = cb.getMulti(id=recent_products.products);
// end of exercise 3.a --------------------------------------------------------------------
		//dump(products); abort;
		return products;
	}
	/*
	* Gets the on sale products
	*/
	public struct function getSaleProducts(){
		var cb = application.couchbase;
		var sale_products = {};
		var products = {};
// start of exercise 3.b ------------------------------------------------------------------
		// get the sale_products document
		sale_products = cb.get(id="sale_products");
		// get all of the keys from sale_products
		products = cb.getMulti(id=sale_products.products);
// end of exercise 3.b --------------------------------------------------------------------
		//dump(products); abort;
		return products;
	}
}

component{
	/*
	* Init
	*/
	public SiteService function init(){
		return this;
	}
	/*
	* Gets the Sites Configuration Values
	*/
	public struct function getSiteConfig(){
		var cb = application.couchbase;
		var config = {};
// start of exercise 2.b ------------------------------------------------------------------
		config = cb.get(id="site_config");
// end of exercise 2.b --------------------------------------------------------------------
		//dump(config); abort;
		return config;
	}
	/*
	* Gets the Sites Configuration Values
	*/
	public struct function getSiteConfig(){
		var cb = application.couchbase;
		var config = {};
// start of exercise 2.b ------------------------------------------------------------------
		config = cb.get(id="site_config");
// end of exercise 2.b --------------------------------------------------------------------
		//dump(config); abort;
		return config;
	}
	/*
	* Gets all of the currently used categories on the site
	*/
	public array function getSiteCategories(){
		var cb = application.couchbase;
		var doc = {};
		var categories = [];
// start of exercise 2.c ------------------------------------------------------------------
		doc = cb.get(id="categories");
// end of exercise 2.c --------------------------------------------------------------------
		categories = doc.categories;
		//dump(categories); abort;
		return categories;
	}
	/*
	* Gets the homepage banners
	*/
	public array function getHomepageBanners(){
		var cb = application.couchbase;
		var doc = {};
		var banners = [];
// start of exercise 2.e ------------------------------------------------------------------
		doc = cb.get(id="banners");
// end of exercise 2.e --------------------------------------------------------------------
		banners = doc.banners;
		//dump(banners); abort;
		return banners;
	}
}
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
		config = cb.get(id="site_config");
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
		doc = cb.get(id="categories");
		categories = doc.categories;
		//dump(categories); abort;
		return categories;
	}
	/*
	* Gets all of the currently used brands on the site
	*/
	public array function getSiteBrands(){
		var cb = application.couchbase;
		var doc = {};
		var brands = [];
		doc = cb.get(id="brands");
		brands = doc.brands;
		//dump(brands); abort;
		return brands;
	}
	/*
	* Gets the homepage banners
	*/
	public array function getHomepageBanners(){
		var cb = application.couchbase;
		var doc = {};
		var banners = [];
		doc = cb.get(id="banners");
		banners = doc.banners;
		//dump(banners); abort;
		return banners;
	}
}
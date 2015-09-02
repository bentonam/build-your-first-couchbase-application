component{
	/*
	* Init
	*/
	public SiteService function init(){
		return this;
	}

	/**
	* Gets the Sites Configuration Values
	*/
	public struct function getSiteConfig(){
		var cb = application.couchbase;
		var default_config = {
			'seo_title' = "Build Your First Couchbase Application",
			'site_name' = "Company Name"
		};
		var config = {};
// start of exercise 2.b ------------------------------------------------------------------

// end of exercise 2.b --------------------------------------------------------------------
		structAppend(config, default_config, false);
		//dump(config); abort;
		return config;
	}

	/**
	* Gets the homepage banners
	*/
	public array function getHomepageBanners(){
		var cb = application.couchbase;
		var doc = {
			'banners' = []
		};
		var banners = [];
// start of exercise 2.e ------------------------------------------------------------------

// end of exercise 2.e --------------------------------------------------------------------
		banners = doc.banners;
		//dump(banners); abort;
		return banners;
	}
}
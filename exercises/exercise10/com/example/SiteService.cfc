component{
	/*
	* Init
	*/
	public com.example.SiteService function init(){
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
		config = cb.get(id="site_config");
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

component{
	/*
	* Init
	*/
	public Brands function init(){
		return this;
	}

	/**
	* Gets all of the currently used brands on the site and their counts
	*/
	public struct function getSiteBrands(){
		var cb = application.couchbase;
		var data = {};
		var query = [];
		try{
			// run the query
			query = cb.query(
				designDocumentName = "products",
				viewName = "by_brand",
				options = {
					group = true,
					reduce = true
				}
			);
			// set the count
			data['count'] = arrayLen(query);
			data['results'] = query;
		}
		catch(any e){
			data['count'] = 0;
		}
		return data;
	}
}
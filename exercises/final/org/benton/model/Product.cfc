component accessors=true {
	property name="product_id" type="string" fieldType="id";
	property name="doc_type" type="string";
	property name="title" type="string";
	property name="slug" type="string";
	property name="short_description" type="string";
	property name="long_description" type="string";
	property name="keywords" type="array";
	property name="category" type="string";
	property name="brand" type="string";
	property name="availability" type="string";
	property name="availability_date" type="numeric";
	property name="price" type="numeric";
	property name="sale_price" type="numeric";
	property name="image" type="string";
	property name="alternate_images" type="array";
	property name="related" type="array";
	property name="created_on" type="numeric";
	property name="active" type="boolean";
	/*
	* Init
	*/
	public Product function init(){
		return this;
	}
	/*
	* Inflates all of the properties based on a structure
	* @data The struct to inflate properties with
	* @allowed A comma-delimited list of properties to allow to be set from data.
	*/
	public void function inflate(required struct data, string allowed){
		var dyn = "";
		// if we only want to allow certain things to be populated, i.e. the form scope is our data
		if(structKeyExists(arguments, "allowed")){
			for(var item in arguments.data){
				// if the item is found in the allowed to be set list, and it has an accessor method set the value
				if(listFindNoCase(arguments.allowed, item) && structKeyExists(arguments.data, item) && structKeyExists(this, "set" & item)){ // make sure the actual item exists and the setter method exists
					dyn = this["set" & item]; // set a pointer to a dynamic setter method for the key/item
					dyn(arguments.data[item]); // call the dynamic setter method
				}
			}
		}
		else{
			structAppend(variables, data);
		}
	}
	/*
	* Gets the availability date in the specified format
	*/
	public date function getAvailabilityDateFormatted(string format="mm/dd/yy"){
		return dateTimeFormat(createObject("java", "java.util.Date").init(getAvailability_Date()));
	}
	/*
	* Determines whether or not the product is on sale
	*/
	public boolean function isOnSale(){
		return getSale_Price() && getSale_Price() < getPrice();
	}
	/*
	* Gets the availability date in the specified format
	*/
	public date function getCreatedOnFormatted(string format="mm/dd/yy"){
		return dateTimeFormat(createObject("java", "java.util.Date").init(getCreated_On()));
	}
	/*
	* Gets the related product documents
	*/
	public struct function getRelatedProducts(){
		var cb = application.couchbase;
		var data = {};
		var query = [];
		try{
			// run the query
			query = cb.query(
				designDocumentName = "products",
				viewName = "all",
				inflateTo="root.org.benton.model.Product",
				options = {
					reduce = false,
					keys = getRelated(), // get the array of related product_ids
					includeDocs = true
				}
			);
			// set the results
			data['results'] = query;
			// set the number of results returned by the query
			data['count'] = arrayLen(data.results);
		}
		catch(any e){
			data['results'] = [];
			data['count'] = 0;
		}
		return data;
	}
	/*
	* Gets the number of reviews
	*/
	public numeric function getReviewTotal(){
		var cb = application.couchbase;
		var query = [];
		var reviews = 0;
		var utils = new root.org.benton.Utils();
		try{
			// run the query
			query = cb.query(
			designDocumentName = "products",
			viewName = "reviews",
			options = {
				reduce = true,
				startKey = [getProduct_ID(), utils.getDateParts("1/1/1970")],
				endKey = [getProduct_ID() & chr(64975), utils.getDateParts("1/1/1970")]
			}
			);
			reviews = arrayLen(query) ? query[1].value : 0;
		}
		catch(any e){
			reviews = 0;
		}
		return reviews;
	}
	/*
	* Gets the review rating
	*/
	public numeric function getReviewRating(){
		var cb = application.couchbase;
		var query = [];
		var rating = 0;
		try{
			// run the query
			query = cb.query(
			designDocumentName = "products",
			viewName = "reviews_avg_rating",
			options = {
				reduce = true,
				key = getProduct_ID()
			}
			);
			rating = arrayLen(query) ? query[1].value : 0;
		}
		catch(any e){
			rating = 0;
		}
		return rating;
	}
	/*
	* Gets reviews for a product
	* @limit The maximum number of results to return
	* @offset The position to start returning results at
	*/
	public struct function getReviews(numeric limit=10, numeric offset=0){
		var cb = application.couchbase;
		var data = {};
		var query = [];
		var utils = new root.org.benton.Utils();
		try{
			// set the total number of documents matc
			data['total'] = getReviewTotal();
			// run the query
			query = cb.query(
				designDocumentName = "products",
				viewName = "reviews",
				inflateTo="root.org.benton.model.Review",
				options = {
					reduce = false,
					sortOrder = "DESC",
					startKey = [getProduct_ID(), utils.getDateParts(now())],
					endKey = [getProduct_ID(), utils.getDateParts("1/1/1970")],
					limit = arguments.limit,
					offset = arguments.offset,
					includeDocs = true
				}
			);
			// set the results
			data['results'] = query;
			// set the number of results returned by the query
			data['count'] = arrayLen(data.results);
		}
		catch(any e){
			data['total'] = 0;
			data['results'] = [];
			data['count'] = 0;
		}
		return data;
	}
	/*
	* Gets review aggregate totals for each rating 1 - 5
	*/
	public array function getReviewAggregates(){
		var cb = application.couchbase;
		var data = [];
		var query = [];
		var utils = new root.org.benton.Utils();
		data[1] = 0;
		data[2] = 0;
		data[3] = 0;
		data[4] = 0;
		data[5] = 0;
		try{
			// run the query
			query = cb.query(
				designDocumentName = "products",
				viewName = "reviews",
				options = {
					reduce = false,
					startKey = [getProduct_ID(), utils.getDateParts("1/1/1970")],
					endKey = [getProduct_ID(), utils.getDateParts(now())]
				}
			);
			for(var item in query){
				data[item.value] += 1;
			}
		}
		catch(any e){
			data[1] = 0;
			data[2] = 0;
			data[3] = 0;
			data[4] = 0;
			data[5] = 0;
		}
		return data;
	}
}
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
	public com.example.documents.Product function init(){
		return this;
	}

	/**
	* Determines whether or not the product is on sale
	*/
	public boolean function isOnSale(){
		return getSale_Price() && getSale_Price() < getPrice();
	}

	/**
	* Gets the total number of reviews for a product
	*/
	public numeric function getReviewTotal(){
		var cb = application.couchbase;
		var total = 0;
		var query = [];
		var utils = new com.example.Utils();
// start of exercise 9.b ------------------------------------------------------------------
		// execute the query to get the total of number of reviews for the product

// end of exercise 9.b --------------------------------------------------------------------
		// set the total number of documents on sale
		total = arrayLen(query) ? query[1].value : 0;
		//dump(var=query, label="query"); dump(var=total, label="total"); abort;
		return total;
	}

	/**
	* Gets reviews for a product
	* @limit The maximum number of results to return
	* @offset The position to start returning results at
	*/
	public array function getReviews(numeric limit=10, numeric offset=0){
		var cb = application.couchbase;
		var query = [];
		var utils = new com.example.Utils();
// start of exercise 9.c ------------------------------------------------------------------
			// execute the query to get the reviews for the product

// end of exercise 9.c --------------------------------------------------------------------
		return query;
	}
}
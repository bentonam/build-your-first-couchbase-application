component{
	/*
	* Init
	*/
	public com.example.OrderTrackingService function init(){
		return this;
	}

	/**
	* Looks up an order based on the order_id, email and postal code
	* @limit The maximum number of results to return
	* @offset The position to start returning results at
	*/
	public com.example.documents.Order function getOrder(required numeric order_id, required string email_address, required numeric postal_code){
		var cb = application.couchbase;
		var order = new com.example.documents.Order();
		var query = [];
		if(arguments.order_id && isValid("email", arguments.email_address) && len(toString(arguments.postal_code))){
// start of exercise 16.b --------------------------------------------------------------------

// start of exercise 16.b --------------------------------------------------------------------
			// if there were results found set the order to the first results document
			if(arrayLen(query)){
				order = query[1].document;
			}
		}
		return order;
	}
}

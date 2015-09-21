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
		var order = "";
		var query = [];
		if(arguments.order_id && isValid("email", arguments.email_address) && len(toString(arguments.postal_code))){
			// execute the query to lookup orders by the order_id, email_address and postal_code
			query = cb.query(
				designDocumentName = "orders",
				viewName = "lookup",
				inflateTo="com.example.documents.Order",
				options = {
					reduce = false,
					key = [int(arguments.order_id), arguments.email_address, arguments.postal_code],
					limit = 1,
					includeDocs = true
				}
			);
			// if there were results found set the order to the first results document
			if(arrayLen(query)){
				order = query[1].document;
			}
			else{ // nothing was found create an empty order object
				order = new com.example.documents.Order();
			}
		}
		return order;
	}
}
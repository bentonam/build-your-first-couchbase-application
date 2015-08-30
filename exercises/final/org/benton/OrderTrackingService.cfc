component{
	/*
	* Init
	*/
	public OrderTrackingService function init(){
		return this;
	}
	/*
	* Looks up an order based on the order_id, email and postal code
	* @limit The maximum number of results to return
	* @offset The position to start returning results at
	*/
	public struct function getOrder(required numeric order_id, required string email_address, required numeric postal_code){
		var cb = application.couchbase;
		var data = {};
		var query = [];
		try{
			data['searched'] = false;
			data['found'] = false;
			if(arguments.order_id && isValid("email", arguments.email_address) && len(toString(arguments.postal_code))){
				data['searched'] = true;
				// run the query
				query = cb.query(
					designDocumentName = "orders",
					viewName = "lookup",
					inflateTo="root.org.benton.documents.Order",
					options = {
						reduce = false,
						key = [int(arguments.order_id), arguments.email_address, arguments.postal_code],
						limit = 1,
						includeDocs = true
					}
				);
				// set the results
				if(arrayLen(query)){
					data['found'] = true;
					data['document'] = query[1].document;
				}
			}
		}
		catch(any e){
			data['searched'] = false;
			data['found'] = false;
		}
		return data;
	}
}
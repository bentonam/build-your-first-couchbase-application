component{
	/*
	* Init
	*/
	public CheckoutService function init(){
		return this;
	}
	/*
	* Gets an incomplete order object and populates it with data
	*/
	public struct function getIncompleteOrder(struct data={}){
		var cb = application.couchbase;
		var cart_service = new root.final.com.benton.CartService();
		var order = {};
		var cart = cart_service.getCart();
		if(structIsEmpty(cart.document.getLine_Items())){
			cflocation(url="cart.cfm", addtoken="false");
			abort;
		}
		order['document'] = new root.final.com.benton.documents.Order();
		// populate any data
		order.document.inflate(data=arguments.data);
		// set the line items
		order.document.setLine_Items(cart.document.getLine_Items());
		// set the sub total
		order.document.setSub_Total(cart.document.getSub_Total());
		// set the shipping total

		// set the tax
		order.document.setTax(
			(order.document.getSub_Total() + order.document.getShipping_Total()) * 0.0725
		);
		// set the grand total
		order.document.setGrand_Total(
			order.document.getSub_Total() +
			order.document.getShipping_Total() +
			order.document.getTax()
		);
		return order;
	}
	/*
	* Saves an Order
	*/
	public struct function saveOrder(struct data={}){
		var order = getIncompleteOrder(arguments.data);
		var cart_service = new root.final.com.benton.CartService();
		// save the order
		order.document.save();
		// clear the cart
		cart_service.clearCart();
		return order;
	}
	/*
	* Gets the states
	*/
	public array function getStates(){
		var cb = application.couchbase;
		var data = [];
		var states = {};
		try{
			states = cb.get(id="states");
			if(!isNull(states)){
				data = states.states;
			}
		}
		catch(any e){
			data = [];
		}
		return data;
	}
	/*
	* Gets the shipping options
	*/
	public struct function getShippingMethods(){
		var cb = application.couchbase;
		var data = {};
		var shipping_methods = {};
		try{
			shipping_methods = cb.get(id="shipping_methods");
			if(!isNull(shipping_methods)){
				data = shipping_methods.shipping_methods;
			}
		}
		catch(any e){
			data = {};
		}
		return data;
	}
}
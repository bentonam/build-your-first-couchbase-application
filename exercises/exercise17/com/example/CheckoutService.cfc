component{
	/*
	* Init
	*/
	public com.example.CheckoutService function init(){
		return this;
	}

	/**
	* Gets the states
	*/
	public array function getStates(){
		var cb = application.couchbase;
		var doc = {};
		var states = [];
// start of exercise 15.a --------------------------------------------------------------------
		doc = cb.get(id="states");
// start of exercise 15.a --------------------------------------------------------------------
		if(!isNull(doc)){
			states = doc.states;
		}
		return states;
	}

	/**
	* Gets the shipping options
	*/
	public struct function getShippingMethods(){
		var cb = application.couchbase;
		var doc = {};
		var shipping_methods = {};
// start of exercise 15.b --------------------------------------------------------------------
		doc = cb.get(id="shipping_methods");
// start of exercise 15.b --------------------------------------------------------------------
		if(!isNull(doc)){
			shipping_methods = doc.shipping_methods;
		}
		return shipping_methods;
	}

	/**
	* Gets an incomplete order object and populates it with data
	*/
	public struct function getIncompleteOrder(struct data={}){
		var cb = application.couchbase;
		var cart_service = new com.example.CartService();
		var order = {};
		var cart = cart_service.getCart();
		var shipping_methods = getShippingMethods();
		if(structIsEmpty(cart.getLine_Items())){
			cflocation(url="cart.cfm", addtoken="false");
			abort;
		}
		order = new com.example.documents.Order();
		// populate any data
		order.inflate(data=arguments.data, allowed="billing_name,billing_email,billing_address_1,billing_address_2,billing_city,billing_state,billing_postal_code,billing_country,billing_phone,shipping_name,shipping_email,shipping_address_1,shipping_address_2,shipping_city,shipping_state,shipping_postal_code,shipping_country,shipping_phone,shipping_code");
		// set the line items
		order.setLine_Items(cart.getLine_Items());
		// set the sub total
		order.setSub_Total(cart.getSub_Total());
		// set the shipping method and total
		if(structKeyExists(shipping_methods, order.getShipping_Code())){
			order.setShipping_Method(shipping_methods[order.getShipping_Code()].name);
			order.setShipping_Total(shipping_methods[order.getShipping_Code()].cost);
		}
		else{
			order.setShipping_Method(shipping_methods.usps.name);
			order.setShipping_Total(shipping_methods.usps.cost);
		}
		// set the tax
		order.setTax(
			(order.getSub_Total() + order.getShipping_Total()) * 0.0725
		);
		// set the grand total
		order.setGrand_Total(
			order.getSub_Total() +
			order.getShipping_Total() +
			order.getTax()
		);
		return order;
	}

	/**
	* Saves an Order
	*/
	public struct function saveOrder(struct data={}){
		var order = getIncompleteOrder(arguments.data);
		var cart_service = new com.example.CartService();
		// save the order
		order.save();
		// clear the cart
		cart_service.clearCart();
		return order;
	}
}
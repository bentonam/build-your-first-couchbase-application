component{
	/*
	* Init
	*/
	public CartService function init(){
		return this;
	}

	/**
	* Gets a Users Shopping Cart
	*/
	public Cart function getCart(){
		var cb = application.couchbase;
		var data = {};
		var cart = {};
// start of exercise 14.a --------------------------------------------------------------------
		// get the cart document and update the expiration time to 30min from now

// end of exercise 14.a ----------------------------------------------------------------------
		// if the cart document doesn't exist create a handle to it
		if(isNull(cart)){
			cart = {
				'value' = new com.example.documents.Cart()
			};
			// set the cart id
			cart.value.setCart_ID(session.sessionID & "_cart");
		}
		// with getAndTouch you get a struct of 2 keys "cas" and "value",
		// where "value" is the document / object, we just want to return
		// the value
		return cart.value;
	}

	/**
	* Updates a Users Shopping Cart
	*/
	public void function setCart(struct data={}){
		var cb = application.couchbase;
		var cart = getCart();
		// update cart values
		if(structKeyExists(arguments.data, "remove_product_id")){ // if there are products to remove
			cart.removeLineItem(arguments.data.remove_product_id);
		}
		else if( // if there are products to add and it has a valid qty that is a postive number
			structKeyExists(arguments.data, "add_product_id") &&
			structKeyExists(arguments.data, "qty") &&
			isNumeric(arguments.data.qty) &&
			arguments.data.qty > 0
		){
			cart.addLineItem(product_id=arguments.data.add_product_id, qty=arguments.data.qty);
		}
		else if(structKeyExists(arguments.data, "product_id")){ // if there are items to update
			for(var product_id in listToArray(arguments.data.product_id)){
				// make sure the product has a qty that is a postive number
				if(
					structKeyExists(arguments.data, product_id & "_qty") &&
					isNumeric(arguments.data[product_id & '_qty']) &&
					arguments.data[product_id & '_qty'] > 0
				){
					// update the line item
					cart.setLineItem(product_id=product_id, qty=arguments.data[product_id & '_qty']);
				}
			}
		}
		// save the cart
		cart.save();
		return;
	}

	/**
	* Clears the Users Shopping Cart
	*/
	public void function clearCart(){
		var cb = application.couchbase;
		var cart = getCart();
		// clear the values
		cart.setLine_Items({});
		cart.setSub_Total(0);
		cart.save();
		return;
	}
}
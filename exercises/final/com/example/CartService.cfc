component{
	/*
	* Init
	*/
	public CartService function init(){
		return this;
	}

	/**
	* Updates a users Cart
	*/
	public void function setCart(struct data={}){
		var cb = application.couchbase;
		var cart = {};
		try{
			cart = getCart();
			// if the cart wasn't found create it
			if(!cart.found){
				cart = {
					'document' = new root.final.com.benton.documents.Cart()
				};
				// set the cart id
				cart.document.setCart_ID(session.sessionID & "_cart");
			}
			// update cart values
			if(structKeyExists(arguments.data, "remove_product_id")){ // if there are products to remove
				cart.document.removeLineItem(arguments.data.remove_product_id);
			}
			else if( // if there are products to add and it has a valid qty that is a postive number
				structKeyExists(arguments.data, "add_product_id") &&
				structKeyExists(arguments.data, "qty") &&
				isNumeric(arguments.data.qty) &&
				arguments.data.qty > 0
			){
				cart.document.addLineItem(product_id=arguments.data.add_product_id, qty=arguments.data.qty);
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
						cart.document.setLineItem(product_id=product_id, qty=arguments.data[product_id & '_qty']);
					}

				}
			}
			// save the cart
			cart.document.save();
		}
		catch(any e){}

		return;
	}

	/**
	* Gets a users Cart
	*/
	public struct function getCart(){
		var cb = application.couchbase;
		var data = {};
		var cart = {};
		try{
			data['found'] = false;
			// get the cart document and update the expiration time to 30min from now
			cart = cb.getAndTouch(
				id=session.sessionID & "_cart",
				inflateTo="root.final.com.benton.documents.Cart",
				timeout=30
			);
			if(!isNull(cart)){ // the cart exists
				data['found'] = true;
				// with getAndCouch you get a struct of 2 keys "cas" and "value", where "value" is the document / object
				data['document'] = cart.value;
			}
			else{ // the cart doesn't exist create a handle to it
				setCart(); // create the cart
				data = getCart(); // reget the cart
			}
		}
		catch(any e){
			data['found'] = false;
		}
		return data;
	}

	/**
	* Clear the cart
	*/
	public void function clearCart(){
		var cb = application.couchbase;
		var cart = {};
		try{
			data['found'] = false;
			// get the cart document and update the expiration time to 30min from now
			cart = cb.get(
				id=session.sessionID & "_cart",
				inflateTo="root.final.com.benton.documents.Cart",
				timeout=30
			);
			if(!isNull(cart)){ // the cart exists
				cart.setLine_Items({});
				cart.setSub_Total(0);
				cart.save();
			}
		}
		catch(any e){}
		return;
	}
}
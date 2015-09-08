component accessors=true {

	property name="cart_id" type="string" fieldType="id";
	property name="doc_type" type="string" default="cart";
	property name="line_items" type="struct";
	property name="sub_total" type="numeric" default="0";
	property name="last_updated" type="numeric";

	/*
	* Init
	*/
	public Cart function init(){
		// make sure line_items has a default value
		if(isNull(getLine_Items())){
			setLine_Items({});
		}
		return this;
	}

	/**
	* Override the setCart_ID accessor to ensure that the value is lowercased
	*/
	public void function setCart_ID(required string value){
		variables['cart_id'] = lCase(arguments.value);
		return;
	}

	/**
	* Gets the last updated date in the specified format
	*/
	public date function getLastUpdatedFormatted(string format="mm/dd/yy h:mm tt"){
		return dateTimeFormat(createObject("java", "java.util.Date").init(getLast_Updated()), arguments.format);
	}

	/**
	* Gets the total number of line items in the cart
	*/
	public numeric function getLineItemTotal(){
		return structCount(getLine_Items());
	}

	/**
	* Adds a Line Item
	*/
	public void function setLineItem(required string product_id, required numeric qty){
		var cb = application.couchbase;
		var product = cb.get(id=arguments.product_id, inflateTo="com.example.documents.Product");
		var line_items = getLine_Items();
		var item = {};
		// if the product was found update it
		if(!isNull(product)){
			// make sure the product is in stock
			if(product.getAvailability() == "In-Stock" || product.getAvailability() == "Preorder"){
				item['product_id'] = product.getProduct_ID();
				item['title'] = product.getTitle();
				item['short_description'] = product.getShort_Description();
				item['image'] = product.getImage();
				item['slug'] = product.getSlug();
				item['price'] = product.isOnSale() ? product.getSale_Price() : product.getPrice();
				item['qty'] = arguments.qty;
				item['sub_total'] = item.price * item.qty;
				line_items[product.getProduct_ID()] = item;
			}
		}
		// save the line items
		setLine_Items(line_items);
		return;
	}

	/*
	* Adds a Line Item
	*/
	public void function addLineItem(required string product_id, required numeric qty){
		var cb = application.couchbase;
		var product = cb.get(id=arguments.product_id, inflateTo="com.example.documents.Product");
		var line_items = getLine_Items();
		var item = {};
		// if the line_item already exists update its qty
		if(structKeyExists(line_items, arguments.product_id)){
			item = line_items[arguments.product_id];
			item['qty'] += arguments.qty;
			item['sub_total'] = item.price * item.qty;
			line_items[arguments.product_id] = item;
		}
		else{
			// if the product was found update it
			if(!isNull(product)){
				// make sure the product is in stock
				if(product.getAvailability() == "In-Stock" || product.getAvailability() == "Preorder"){
					item['product_id'] = product.getProduct_ID();
					item['title'] = product.getTitle();
					item['short_description'] = product.getShort_Description();
					item['image'] = product.getImage();
					item['slug'] = product.getSlug();
					item['price'] = product.isOnSale() ? product.getSale_Price() : product.getPrice();
					item['qty'] = arguments.qty;
					item['sub_total'] = item.price * item.qty;
					line_items[product.getProduct_ID()] = item;
				}
			}
		}
		// save the line items
		setLine_Items(line_items);
		return;
	}

	/**
	* Removes a Line Item
	*/
	public void function removeLineItem(required string product_id){
		var line_items = getLine_Items();
		// remove the line_item
		structDelete(line_items, arguments.product_id);
		// save the line items
		setLine_Items(line_items);
		return;
	}

	/**
	* Saves the cart
	*/
	public void function save(){
		var cb = application.couchbase;
		var utils = new com.example.Utils();
		// set the last updated
		setLast_Updated(utils.toEpoch(date=now(), convert_to_utc=false));
		// calculate and set the sub total
		setSub_Total(calculateSubTotal());
// start of exercise 14.b --------------------------------------------------------------------
		// write the cart document and set it's expiration for 30min
		cb.set(
			id=getCart_ID(),
			value=this,
			timeout=30
		);
// end of exercise 14.b ----------------------------------------------------------------------
		return;
	}

	/**
	* Calculates the sub total
	*/
	private numeric function calculateSubTotal(){
		var sub_total = 0;
		var line_items = getLine_Items()
		for(var item in line_items){
			sub_total += line_items[item].sub_total;
		}
		return sub_total;
	}
}
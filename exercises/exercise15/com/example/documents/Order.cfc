component accessors=true {
	// general order details
	property name="order_id" type="string" fieldType="id";
	property name="doc_type" type="string" default="order";
	property name="order_date" type="numeric" default="0";
	property name="order_status" type="string" default="Pending";
	// billing fields
	property name="billing_name" type="string" default="";
	property name="billing_email" type="string" default="";
	property name="billing_address_1" type="string" default="";
	property name="billing_address_2" type="string" default="";
	property name="billing_city" type="string" default="";
	property name="billing_state" type="string" default="";
	property name="billing_postal_code" type="string" default="";
	property name="billing_country" type="string" default="US";
	property name="billing_phone" type="string" default="";
	// shipping fields
	property name="shipping_name" type="string" default="";
	property name="shipping_email" type="string" default="";
	property name="shipping_address_1" type="string" default="";
	property name="shipping_address_2" type="string" default="";
	property name="shipping_city" type="string" default="";
	property name="shipping_state" type="string" default="";
	property name="shipping_postal_code" type="string" default="";
	property name="shipping_country" type="string" default="US";
	property name="shipping_phone" type="string" default="";
	// products and totals
	property name="line_items" type="struct";
	property name="sub_total" type="numeric" default="0";
	property name="shipping_code" type="string" default="";
	property name="shipping_method" type="string" default="";
	property name="shipping_total" type="numeric" default="0";
	property name="tax" type="numeric" default="0";
	property name="grand_total" type="numeric" default="0";

	/*
	* Init
	*/
	public Order function init(){
		// make sure line_items has a default value
		if(isNull(getLine_Items())){
			setLine_Items({});
		}

		return this;
	}

	/**
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

	/**
	* Gets the last updated date in the specified format
	*/
	public string function getOrderDateFormatted(string format="mm/dd/yy h:mm tt"){
		return getOrder_Date() ? dateTimeFormat(createObject("java", "java.util.Date").init(getOrder_Date()), arguments.format) : "";
	}

	/**
	* Saves the order
	*/
	public void function save(){
		var cb = application.couchbase;
		var utils = new com.example.Utils();
		var order_id = 0;
		// set the order date
		setOrder_Date(utils.toEpoch(now()));
// start of exercise 15.c --------------------------------------------------------------------
		// get the next order id

// end of exercise 15.c ----------------------------------------------------------------------
		// set the order id
		setOrder_ID(order_id);
// start of exercise 15.d --------------------------------------------------------------------
		// write the order document

// end of exercise 15.c ----------------------------------------------------------------------
		return;
	}
}
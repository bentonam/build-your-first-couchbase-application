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
}
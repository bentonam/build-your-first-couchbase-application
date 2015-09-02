component accessors=true {

	property name="review_id" type="string" fieldType="id";
	property name="doc_type" type="string" fieldType="id";
	property name="product_id" type="string";
	property name="reviewer_name" type="string";
	property name="reviewer_email" type="string";
	property name="rating" type="numeric";
	property name="review_title" type="string";
	property name="review_body" type="string";
	property name="review_date" type="numeric";

	/*
	* Init
	*/
	public Review function init(){
		return this;
	}
	/*
	* Gets the review date in the specified format
	*/
	public date function getReviewDateFormatted(string format="mm/dd/yy"){
		return dateTimeFormat(createObject("java", "java.util.Date").init(getReview_Date()), arguments.format);
	}
}
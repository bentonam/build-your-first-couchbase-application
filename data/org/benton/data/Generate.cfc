component output="false"{
	/*
	* Init
	*/
	public Generate function init(){
		variables['start'] = getTickCount();
		variables['product_ids'] = [];
		variables['configs'] = {};
		variables['slug'] = new root.org.benton.utils.Slug();
		loadConfigs();
		return this;
	}
	/*
	* Load all of the static config documents
	*/
	private void function loadConfigs(){
		var cb = application.couchbase; // pointer to the default bucket handler
		var documents  = directoryList("/root/static-documents", true, "query", "*.json"); // get all of the static config documents
		var key = "";
		for(var i = 1; i <= documents.recordCount; i++){
			key = replace(documents.name[i], ".json", "");
			variables['configs'][key] = deserializeJSON(fileRead(documents.directory[i] & "/" & documents.name[i]))
			application.couchbase.set(key, configs[key])
		}
	}
	/*
	* Generates Test Product Data
	*/
	public void function generateTestData(){
		var cb = application.couchbase; // pointer to the default bucket handler
		var products = 10000;
		var orders = 5000;
		var doc = {};
		for(var i = 1; i <= products; i++){
			// build a test product document
			doc = buildProductDocument();
			// write the document
			cb.set(doc.product_id, doc);
			// generate product reviews
			buildReviews(doc.product_id);
			// save the product_id globally so it can be used to generate related products
			arrayAppend(variables.product_ids, doc.product_id);
		}
		for(var i = 1; i <= orders; i++){
			// build a test product document
			doc = buildOrderDocument();
			// write the document
			cb.set("order_" & doc.order_id, doc);
		}
		dump(getTickCount() - variables.start & "ms");
		dump('done'); abort;
	}
	/*
	* Generates a Product Document
	*/
	private struct function buildProductDocument(){
		var doc = {};
		doc['product_id'] = lCase(createUUID());
		doc['doc_type'] = "product";
		doc['title'] = generateTitle();
		doc['slug'] = variables.slug.generate(doc.title);
		doc['short_description'] = generateShortDescription();
		doc['long_description'] = generateProductDescription();
		doc['keywords'] = generateKeywords();
		doc['category'] = generateCategory();
		doc['brand'] = generateBrand();
		doc['availability'] = generateAvailability();
		doc['availability_date'] = generateAvailabilityDate();
		doc['price'] = generatePrice();
		doc['sale_price'] = generateSalePrice(doc.price);
		doc['image'] = generateImage();
		doc['alternate_images'] = generateAlternateImages();
		doc['related'] = generateRelated();
		doc['created_on'] = generateDate(end_date=doc.availability_date);
		doc['active'] = generateActive();
		return doc;
	}
	/*
	* Generates a title
	*/
	private string function generateTitle(){
		var title = [];
		var words = randRange(3, 8); // use 3 to 8 words for the product title
		for(var i = 1; i <= words; i++){
			arrayAppend(title, variables.configs.words.words[randRange(1, arrayLen(variables.configs.words.words))]);
		}
		return reReplace(arrayToList(title, " "), "\b(\w)", "\u\1", "all");
	}
	/*
	*  Gets a short description
	*/
	private string function generateShortDescription(){
		var description = variables.configs.paragraphs.paragraphs[randRange(1, arrayLen(variables.configs.paragraphs.paragraphs))];
		return left(description, find(".", description) - 1); // return just the first sentence
	}
	/*
	*  Gets a product description
	*/
	private string function generateProductDescription(){
		var description = generateLongDescription();
		// generate a heading
		description &= "<h3>" & generateTitle() & "</h3>";
		// generate a list
		description &= "<ul>";
		for(var i = 1; i <= randRange(5, 15); i++){
			description &= "<li>" & generateShortDescription() & "</li>";
		}
		description &= "<ul>";
		// generate another long description
		description &= generateLongDescription();
		return description;
	}
	/*
	*  Gets a long description
	*/
	private string function generateLongDescription(){
		var description = [];
		var paragraphs = randRange(1, 3); // use 1 to 5 paragraphs for the description
		for(var i = 1; i <= paragraphs; i++){
			arrayAppend(description, variables.configs.paragraphs.paragraphs[randRange(1, arrayLen(variables.configs.paragraphs.paragraphs))]);
		}
		return "<p>" & arrayToList(description, "</p><p>") & "</p>";
	}
	/*
	* Generates keywords
	*/
	private array function generateKeywords(){
		var keywords = [];
		var words = randRange(3, 10); // use 3 to 10 words for the keywords
		for(var i = 1; i <= words; i++){
			arrayAppend(keywords, reReplace(variables.configs.words.words[randRange(1, arrayLen(variables.configs.words.words))], "\b(\w)", "\u\1", "all"));
		}
		return keywords;
	}
	/*
	* Generates a category
	*/
	private string function generateCategory(){
		return variables.configs.categories.categories[randRange(1, arrayLen(variables.configs.categories.categories))].name;
	}
	/*
	* Generates a brand
	*/
	private string function generateBrand(){
		return variables.configs.brands.brands[randRange(1, arrayLen(variables.configs.brands.brands))].name;

	}
	/*
	* Generates an availability status
	*/
	private string function generateAvailability(){
		var availabilities = ["Preorder", "In-Stock", "Out of Stock", "Discontinued"];
		return availabilities[randRange(1, arrayLen(availabilities))];
	}
	/*
	* Generates an availability date
	*/
	private numeric function generateAvailabilityDate(){
		return generateDate();
	}
	/*
	* Generates a price
	*/
	private numeric function generatePrice(){
		return (randRange(9, 999) & "." & randRange(0, 9) & randRange(0, 9)) + 0;
	}
	/*
	* Generates a sale price
	*/
	private numeric function generateSalePrice(required numeric price){
		return generateBoolean(15) ? (randRange(1, arguments.price - 1) & "." & randRange(0, 9) & randRange(0, 9)) + 0 : 0;

	}
	/*
	* Generates a product image
	*/
	private string function generateImage(numeric width=400, numeric height=400){
		var image_url = "http://lorempixel.com/";
		var categories = ["abstract", "animals", "business", "cats", "city", "food", "nightlife", "fashion", "people", "nature", "sports", "technics", "transport"]
		// set the height and width
		image_url &= arguments.width & "/" & arguments.height & "/";
		// set a random category
		image_url &= categories[randRange(1, arrayLen(categories))] & "/";
		// add a timestamp to ensure unique images
		image_url &= "?t=" & now().getTime();
		return image_url;
	}
	/*
	* Generates alternate product images
	*/
	private array function generateAlternateImages(){
		var alternates = [];
		var images = randRange(1, 3);
		for(var i = 1; i <= images; i++){
			arrayAppend(alternates, generateImage());
		}
		return alternates;
	}
	/*
	* Generates a random amount of related products
	*/
	private array function generateRelated(){
		var data = variables.product_ids;
		var count = arrayLen(data);
		var generate = count ? randRange(0, 6) : 0;
		var related = [];
		for(var i = 1; i <= generate; i++){
			arrayAppend(related, data[randRange(1, arrayLen(data))]);
		}
		return dedupArray(related);
	}
	/*
	* Generates an active status
	*/
	private boolean function generateActive(){
		return generateBoolean(90);
	}
	/*
	* Generates a random boolean based on a chance
	* @change A value 0 - 100 of the chance to generate a boolean of true
	*/
	private boolean function generateBoolean(required numeric chance=50){
		return randRange(0, 100) < arguments.chance ? true : false;
	}
	/*
	* Generates a random epoch date date
	*/
	private numeric function generateDate(required date start_date="1/1/2014", required date end_date="1/1/2017"){
		var date = var generated = dateTimeFormat(arguments.start_date + createTimeSpan(0, 0, 0, randRange(0, dateDiff("s", arguments.start_date, arguments.end_date))), "mm/dd/yyyy HH:mm:ss");
		return createDateTime(
				year(generated), // year
				month(generated), // month
				day(generated), // day
				hour(generated), // hour
				minute(generated), // minute
				second(generated) // second
			).getTime();
	}
	/*
	* Builds Product Reviews
	*/
	private void function buildReviews(required string product_id){
		var cb = application.couchbase; // pointer to the default bucket handler
		var doc = {};
		var reviews = randRange(0, 25);
		var review_id = 0;
		for(var i = 1; i <= reviews; i++){
			// get the current review counter value and increment it
			review_id = cb.incr(arguments.product_id & "_reviews_counter", 1, 1);
			// build a review
			doc['review_id'] = review_id;
			doc['doc_type'] = "review";
			doc['product_id'] = arguments.product_id;
			doc['reviewer_name'] = generateName();
			doc['reviewer_email'] = generateEmail(doc.reviewer_name);
			doc['rating'] = generateRating();
			doc['review_title'] = generateTitle();
			doc['review_body'] = generateLongDescription();
			doc['review_date'] = generateDate(end_date=now());
			// write the review document
			cb.set(arguments.product_id & "_review_" & review_id, doc);
		}
		return;
	}
	/*
	* Generates a name
	*/
	private string function generateName(){
		return variables.configs.people.people[randRange(1, arrayLen(variables.configs.people.people))];
	}
	/*
	* Generates a email
	*/
	private string function generateEmail(string name){
		var person = structKeyExists(arguments, "name") ? arguments.name : generateName();
		return replace(slug.generate(person), "-", ".") & "@" & variables.configs.words.words[randRange(1, arrayLen(variables.configs.words.words))] & ".com"
	}
	/*
	* Generates a rating
	*/
	private string function generateRating(){
		return randRange(1, 5);
	}
	/*
	* Generates an Order Document
	*/
	private struct function buildOrderDocument(){
		var cb = application.couchbase; // pointer to the default bucket handler
		var doc = {};
		// get the current orders counter value and increment it
		doc['order_id'] = cb.incr("orders_counter", 1, 1);
		doc['doc_type'] = "order";
		doc['order_date'] = generateDate();
		doc['order_status'] = generateOrderStatus();
		doc['billing_name'] = generateName();
		doc['billing_email'] = generateEmail(doc.billing_name);
		doc['billing_address_1'] = generateAddress1();
		doc['billing_address_2'] = generateAddress2();
		doc['billing_city'] = generateCity();
		doc['billing_state'] = generateState();
		doc['billing_postal_code'] = generatePostalCode();
		doc['billing_country'] = generateCountry();
		doc['billing_phone'] = generatePhone();
		if(generateBoolean(70)){ // use the same billing info for shipping
			doc['shipping_name'] = doc.billing_name;
			doc['shipping_email'] = doc.billing_email;
			doc['shipping_address_1'] = doc.billing_address_1;
			doc['shipping_address_2'] = doc.billing_address_2;
			doc['shipping_city'] = doc.billing_city;
			doc['shipping_state'] = doc.billing_state;
			doc['shipping_postal_code'] = doc.billing_postal_code;
			doc['shipping_country'] = doc.billing_country;
			doc['shipping_phone'] = doc.billing_phone;
		}
		else{
			doc['shipping_name'] = generateName();
			doc['shipping_email'] = generateEmail(doc.shipping_name);
			doc['shipping_address_1'] = generateAddress1();
			doc['shipping_address_2'] = generateAddress2();
			doc['shipping_city'] = generateCity();
			doc['shipping_state'] = generateState();
			doc['shipping_postal_code'] = generatePostalCode();
			doc['shipping_country'] = generateCountry();
			doc['shipping_phone'] = generatePhone();
		}
		doc['line_items'] = generateLineItems();
		doc['shipping_method'] = generateShippingMethod();
		doc['sub_total'] = calculateSubTotal(doc.line_items);
		doc['shipping_total'] = generateShippingTotal();
		doc['tax'] = generateTax(doc.sub_total + doc.shipping_total) * 0.0725;
		doc['grand_total'] = doc.sub_total + doc.shipping_total + doc.tax;
		return doc;
	}
	/*
	* Generates an order status
	*/
	private string function generateOrderStatus(){
		var statuses = ["Processing", "Cancelled", "Shipped"];
		return statuses[randRange(1, arrayLen(statuses))];
	}
	/*
	* Generates a address 1
	*/
	private string function generateAddress1(){
		return randRange(1, 9999) & " " & variables.configs.streets.streets[randRange(1, arrayLen(variables.configs.streets.streets))];
	}
	/*
	* Generates a address 2
	*/
	private string function generateAddress2(){
		return chr(randRange(65, 90)) & randRange(1,99);
	}
	/*
	* Generates a city
	*/
	private string function generateCity(){
		return variables.configs.cities.cities[randRange(1, arrayLen(variables.configs.cities.cities))];
	}
	/*
	* Generates a state
	*/
	private string function generateState(){
		return variables.configs.states.states[randRange(1, arrayLen(variables.configs.states.states))].code;
	}
	/*
	* Generates a postal code
	*/
	private string function generatePostalCode(){
		return "" & randRange(10000, 99999);
	}
	/*
	* Generates a country
	*/
	private string function generateCountry(){
		return "US";
	}
	/*
	* Generates a phone
	*/
	private string function generatePhone(){
		return "" & randRange(1000000000, 9999999999);
	}
	/*
	* Generate order line items
	*/
	private struct function generateLineItems(){
		var cb = application.couchbase; // pointer to the default bucket handler
		var data = {};
		var products = randRange(1, 10);
		var product = {};
		for(var i = 1; i <= products; i++){
			product = cb.get(variables.product_ids[randRange(1, arrayLen(variables.product_ids))]);
			data[product.product_id] = {};
			data[product.product_id]['product_id'] = product.product_id;
			data[product.product_id]['title'] = product.title;
			data[product.product_id]['short_description'] = product.short_description;
			data[product.product_id]['image'] = product.image;
			data[product.product_id]['slug'] = product.slug;
			data[product.product_id]['price'] = product.sale_price ? product.sale_price : product.price;
			data[product.product_id]['qty'] = randRange(1, 10);
			data[product.product_id]['sub_total'] = data[product.product_id].price * data[product.product_id].qty;
		}
		return data;
	}
	/*
	* Generates a shipping method
	*/
	private string function generateShippingMethod(){
		var codes = listToArray(structKeyList(variables.configs.shipping_methods.shipping_methods));
		return variables.configs.shipping_methods.shipping_methods[codes[randRange(1, arrayLen(codes))]].name;
	}
	/*
	* Calculates the sub total
	*/
	private numeric function calculateSubTotal(required struct line_items){
		var sub_total = 0;
		for(var item in arguments.line_items){
			sub_total += arguments.line_items[item].sub_total;
		}
		return sub_total;
	}
	/*
	* Generates a shipping total
	*/
	private numeric function generateShippingTotal(){
		return randRange(5, 30) & "." & randRange(0, 9) & randRange(0, 9);
	}
	/*
	* Generates the tax
	*/
	private numeric function generateTax(required numeric sub_total){
		var tax_rate = randRange(10, 35) / 100;
		return numberFormat(arguments.sub_total * tax_rate, "9.99");
	}
	/*
	* Removes duplicate values from an array and returns a cleaned version
	*/
	private array function dedupArray(required array input){
		var data = [];
		var count = arrayLen(arguments.input);
		for(var i = 1; i <= count; i++){
			if(data.indexOf(arguments.input[i]) == -1){
				arrayAppend(data, arguments.input[i]);
			}
		}
		return data;
	}
}
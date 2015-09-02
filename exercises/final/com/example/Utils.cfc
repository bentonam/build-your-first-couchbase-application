component{
	public string function getRandomImage(numeric width=200, numeric height=200){
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

	/**
	* Takes a date and generates an array of Year, Month, Day, Hour, Minute, Seconds
	* @input A date to get the parts for
	*/
	public array function getDateParts(required date input){
		return [
			datePart("yyyy", arguments.input),
			datePart("m", arguments.input),
			datePart("d", arguments.input),
			datePart("h", arguments.input),
			datePart("n", arguments.input),
			datePart("s", arguments.input)
		];
	}

	/*
	* Takes a date and generates an array of Year, Month, Day, Hour, Minute, Seconds
	* @offset The current offset
	* @limit The number of records to return at a time
	* @total The total number of records
	*/
	public struct function getPagination(required numeric offset, required numeric limit, required numeric total){
		var pagination = {};
		var page_start = 0;
		var page_length = 0;
		pagination['previous_offset'] = arguments.offset - arguments.limit;
		pagination['has_previous'] = pagination.previous_offset >= 0;
		pagination['next_offset'] = arguments.offset + arguments.limit + 1;
		pagination['has_next'] = pagination.next_offset < arguments.total;
		pagination['total_pages'] = ceiling(arguments.total / arguments.limit);
		pagination['current_page'] = ceiling((arguments.offset + 1) / arguments.limit);
		pagination['pages'] = [];
		for(var i = 0; i < pagination.total_pages; i++){
			arrayAppend(pagination.pages, {
				'number' = i + 1,
				'offset' = (i * arguments.limit)
			});
		}
		if(arrayLen(pagination.pages)){
			pagination['first_offset'] = pagination.pages[1].offset;
			pagination['last_offset'] = pagination.pages[arrayLen(pagination.pages)].offset;
			// get at most 10 pages
			page_length = pagination.total_pages > 10 ? 10 : pagination.total_pages;
			page_start = page_length + pagination.current_page + 1 > pagination.total_pages ? pagination.total_pages - page_length + 1 : pagination.current_page <= 5 ? 1 : pagination.current_page - 5;
			pagination['pages'] = arraySlice(pagination.pages, page_start, page_length);
		}
		else{
			pagination['first_offset'] = 0;
			pagination['last_offset'] = 0;
		}
		pagination['current_offset'] = arguments.offset;
		return pagination;
	}

	/**
	* Converts a date to epoch time
	* @date The date the convert to epoch
	* @convert_to_utc Whether or not the convert the date to utc time
	*/
	public numeric function toEpoch(required date date, boolean convert_to_utc=true){
		var epoch = 0;
		if(arguments.convert_to_utc){
			epoch = dateConvert("local2utc", arguments.date).getTime();
		}
		else{
			epoch = arguments.date.getTime();
		}
		return epoch;
	}
}
component{
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
}
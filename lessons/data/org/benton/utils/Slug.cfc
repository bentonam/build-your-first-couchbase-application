component output="false"{
	/**
	* Slug Init
	*/
	public struct function init(){
		return this;
	}
	/**
	* Takes a string a returns a URL / SEO Friendly Format
	* @input The input string to generate a slug for
	* @remove (optional) string or regex of characters to remove
	* @dups (optional) Whether or not to allow duplicate words in the slug
	*/
	public string function generate(required string input, string remove="", boolean dups=true){
		var slug = arguments.input;
		try{
			slug = urlDecode(slug);
		}
		catch(any e){
		}
		slug = slug
					.toLowerCase() // convert the string to lowercase
					.replaceAll(remove, "" ) // allows additional words / phrases to be removed in the slug
					.replaceAll("[àáâäå]", "a" ) // convert to ascii "a"
					.replaceAll("[çĉ]", "c" ) // convert to ascii "c"
					.replaceAll("[éèêë]", "e" ) // convert to ascii "c"
					.replaceAll("ĝ", "g" ) // convert to ascii "g"
					.replaceAll("ĥ", "h" ) // convert to ascii "h"
					.replaceAll("[ïíîì]", "i" ) // convert to ascii "i"
					.replaceAll("ĵ", "j" ) // convert to ascii "j"
					.replaceAll("ñ", "n" ) // convert to ascii "n"
					.replaceAll("[ôöõøöòó]", "o" ) // convert to ascii "o"
					.replaceAll("[šŝ]", "s" ) // convert to ascii "s"
					.replaceAll("[üûùúŭû]", "u" ) // convert to ascii "u"
					.replaceAll("[ýÿ]", "u" ) // convert to ascii "y"
					.replaceAll("ž", "z" ) // convert to ascii "z"
					.replaceAll("&[##A-zA-Z0-9]+;(?i)", "" ) // remove HTML Entities
					.replaceAll("&(?i)", " and " ) // replace standalone ampersands with the word and
					.replaceAll("\+", " ") // replace all +'s with a space
					.replaceAll("[^A-Za-z0-9- ]+(?i)", "" ) // remove all Non-AlphaNumeric Characters except for Spaces or Dashes
					.trim() // remove leading and trailing spaces
					.replaceAll("\s+", "-" ) // replace 1 or more spaces with a single -
					.replaceAll("-+", "-" ); // replace 2 or more dashes with a single -
		if(!arguments.dups){
			slug = dedup(slug);
		}
		return slug;
	}

	/**
	* Removes Duplicates from a string
	* @input The input to remove duplicates from
	*/
	private string function dedup(required string input){
		var input = listToArray(arguments.input, "-");
		var cleaned = [];
		var count = 0;
		count = arrayLen(input);
		for(var i = 1; i <= count; i++){ // loop over each part of the slug
			if(cleaned.indexOf(input[i]) == -1){
				arrayAppend(cleaned, input[i]);
			}
		}
		return arrayToList(cleaned, "-");
	}
}

<!--- default url variables --->
<cfparam name="url.keyword" type="string" default=""/>
<cfparam name="url.limit" type="numeric" default="24"/>
<cfparam name="url.offset" type="numeric" default="0"/>
<!--- get a handle to the product service --->
<cfset variables['search_service'] = new com.example.SearchService()/>
<!--- get the products from the keyword search --->
<cfset variables['products'] = variables.search_service.getProductsBySearch(keyword=urlDecode(url.keyword), limit=url.limit, offset=url.offset)/>
<!--- get a handle to the utils --->
<cfset variables['utils'] = new com.example.Utils()/>
<!--- get the pagination based on the results --->
<cfset variables['pagination'] = variables.utils.getPagination(limit=url.limit, offset=url.offset, total=variables.products.total)/>
<cfoutput>
<!--- start of product listing --->
<div class="product-listing">
	<div class="row headline">
		<h2 class="col-md-12">Your search for "#urlDecode(encodeForHTML(url.keyword))#" returned #numberFormat(variables.products.total)# results</h2>
	</div>
	<div class="row">
		<cfloop array="#variables.products.results#" index="variables.product">
			<cfinclude template="includes/template.product.cfm"/>
		</cfloop>
	</div>
</div>
<!--- end of product listing --->
<!--- start of pagination --->
<cfif variables.pagination.total_pages>
	<ul class="pagination">
		<cfif variables.pagination.has_previous>
			<li><a href="?keyword=#urlEncodedFormat(url.keyword)#&offset=#variables.pagination.previous_offset#">«</a></li>
		</cfif>
		<cfloop array="#variables.pagination.pages#" index="variables.page">
			<cfif variables.page.offset eq variables.pagination.current_offset>
				<li class="active"><a>#variables.page.number#</a></li>
			<cfelse>
				<li><a href="?keyword=#urlEncodedFormat(url.keyword)#&offset=#variables.page.offset#">#variables.page.number#</a></li>
			</cfif>
		</cfloop>
		<cfif variables.pagination.has_next>
			<li><a href="?keyword=#urlEncodedFormat(url.keyword)#&offset=#variables.pagination.next_offset#">»</a></li>
		</cfif>
	</ul>
</cfif>
<!--- end of pagination --->
</cfoutput>
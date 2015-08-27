<!--- default url variables --->
<cfparam name="url.brand" type="string" default=""/>
<cfparam name="url.limit" type="numeric" default="24"/>
<cfparam name="url.offset" type="numeric" default="0"/>
<!--- get the recent products --->
<cfset product_service = new root.org.benton.ProductService()/>
<cfset products = product_service.getProductsByBrand(brand=urlDecode(url.brand), limit=url.limit, offset=url.offset)/>
<!--- get the pagination based on the results --->
<cfset utils = new root.org.benton.Utils()/>
<cfset pagination = utils.getPagination(limit=url.limit, offset=url.offset, total=products.total)/>
<cfoutput>
<!--- start of product listing --->
<div class="product-listing">
	<div class="row headline">
		<h2 class="col-md-8">Brand: #urlDecode(url.brand)#</h2>
	</div>
	<div class="row">
		<cfloop array="#products.results#" index="product">
			<cfinclude template="/root/view/includes/result.product.cfm"/>
		</cfloop>
	</div>
</div>
<!--- end of product listing --->
<!--- start of pagination --->
<ul class="pagination">
	<li><a href="?brand=#urlEncodedFormat(url.brand)#&offset=#pagination.first_offset#">First</a></li>
	<cfif pagination.has_previous>
		<li><a href="?brand=#urlEncodedFormat(url.brand)#&offset=#pagination.previous_offset#">«</a></li>
	</cfif>
	<cfloop array="#pagination.pages#" index="page">
		<cfif page.offset eq pagination.current_offset>
			<li class="active"><a>#page.number# <span class="sr-only">(current)</span></a></li>
		<cfelse>
			<li><a href="?brand=#urlEncodedFormat(url.brand)#&offset=#page.offset#">#page.number#</a></li>
		</cfif>
	</cfloop>
	<cfif pagination.has_next>
		<li><a href="?brand=#urlEncodedFormat(url.brand)#&offset=#pagination.next_offset#">»</a></li>
	</cfif>
	<li><a href="?brand=#urlEncodedFormat(url.brand)#&offset=#pagination.last_offset#">Last</a></li>
</ul>
<!--- end of pagination --->
</cfoutput>
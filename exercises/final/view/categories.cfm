<!--- default url variables --->
<cfparam name="url.category" type="string" default=""/>
<cfparam name="url.limit" type="numeric" default="24"/>
<cfparam name="url.offset" type="numeric" default="0"/>
<!--- get a handle to the product service --->
<cfset variables['product_service'] = new root.org.benton.ProductService()/>
<!--- get the products in the category --->
<cfset variables['products'] = variables.product_service.getProductsByCategory(category=urlDecode(url.category), limit=url.limit, offset=url.offset)/>
<!--- get a handle to the utils --->
<cfset variables['utils'] = new root.org.benton.Utils()/>
<!--- get the pagination based on the results --->
<cfset variables['pagination'] = variables.utils.getPagination(limit=url.limit, offset=url.offset, total=variables.products.total)/>
<cfoutput>
<!--- start of product listing --->
<div class="product-listing">
	<!--- start of breadcrumb --->
	<ol class="breadcrumb">
		<li><a href="index.cfm">Home</a></li>
		<li class="active">Categories</li>
		<li><a href="categories.cfm?category=#urlEncodedFormat(url.category)#">#encodeForHTML(url.category)#</a></li>
	</ol>
	<!--- end of breadcrumb --->
	<div class="row">
		<cfloop array="#variables.products.results#" index="variables.product">
			<cfinclude template="/root/view/includes/result.product.cfm"/>
		</cfloop>
	</div>
</div>
<!--- end of product listing --->
<!--- start of pagination --->
<ul class="pagination">
	<cfif variables.pagination.has_previous>
		<li><a href="?category=#urlEncodedFormat(url.category)#&offset=#variables.pagination.previous_offset#">«</a></li>
	</cfif>
	<cfloop array="#variables.pagination.pages#" index="variables.page">
		<cfif variables.page.offset eq variables.pagination.current_offset>
			<li class="active"><a>#variables.page.number# <span class="sr-only">(current)</span></a></li>
		<cfelse>
			<li><a href="?category=#urlEncodedFormat(url.category)#&offset=#variables.page.offset#">#variables.page.number#</a></li>
		</cfif>
	</cfloop>
	<cfif variables.pagination.has_next>
		<li><a href="?category=#urlEncodedFormat(url.category)#&offset=#variables.pagination.next_offset#">»</a></li>
	</cfif>
</ul>
<!--- end of pagination --->
</cfoutput>
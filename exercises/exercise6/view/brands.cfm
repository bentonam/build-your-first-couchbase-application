<!--- default url variables --->
<cfparam name="url.brand" type="string" default=""/>
<cfparam name="url.limit" type="numeric" default="24"/>
<cfparam name="url.offset" type="numeric" default="0"/>
<!--- get a handle to the brand service --->
<cfset variables['brand_service'] = new root.exercise6.com.example.BrandService()/>
<!--- get the products in the brand --->
<cfset variables['products'] = variables.brand_service.getProductsByBrand(
	brand=urlDecode(url.brand),
	limit=url.limit,
	offset=url.offset
)/>
<!--- get the products in the brand --->
<cfset variables['total_products'] = variables.brand_service.getProductsTotalForBrand(
	brand=urlDecode(url.brand)
)/>
<!--- get a handle to the utils --->
<cfset variables['utils'] = new root.exercise6.com.example.Utils()/>
<!--- get the pagination based on the results --->
<cfset variables['pagination'] = variables.utils.getPagination(
	limit=url.limit,
	offset=url.offset,
	total=variables.total_products)
/>
<cfoutput>
<!--- start of product listing --->
<div class="product-listing">
	<!--- start of breadcrumb --->
	<ol class="breadcrumb">
		<li><a href="index.cfm">Home</a></li>
		<li class="active">Brands</li>
		<li><a href="brands.cfm?brand=#urlEncodedFormat(url.brand)#">#encodeForHTML(url.brand)#</a> (#numberFormat(variables.total_products)# Products)</li>
	</ol>
	<!--- end of breadcrumb --->
	<div class="row">
		<!--- loop over the brand products query --->
		<cfloop array="#variables.products#" index="variables.item">
			<!---
				since it is an array of document structures and we want the template to be normalized
				through all results created a normalized structure for the template before including it
			--->
			<cfset variables['product'] = variables.item.document/>
			<cfinclude template="includes/template.product.cfm"/>
		</cfloop>
	</div>
</div>
<!--- end of product listing --->
<!--- start of pagination --->
<ul class="pagination">
	<cfif variables.pagination.has_previous>
		<li><a href="?brand=#urlEncodedFormat(url.brand)#&offset=#variables.pagination.previous_offset#">«</a></li>
	</cfif>
	<cfloop array="#variables.pagination.pages#" index="variables.page">
		<cfif variables.page.offset eq variables.pagination.current_offset>
			<li class="active"><a>#variables.page.number# <span class="sr-only">(current)</span></a></li>
		<cfelse>
			<li><a href="?brand=#urlEncodedFormat(url.brand)#&offset=#variables.page.offset#">#variables.page.number#</a></li>
		</cfif>
	</cfloop>
	<cfif variables.pagination.has_next>
		<li><a href="?brand=#urlEncodedFormat(url.brand)#&offset=#variables.pagination.next_offset#">»</a></li>
	</cfif>
</ul>
<!--- end of pagination --->
</cfoutput>
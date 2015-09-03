<!--- default url variables --->
<cfparam name="url.category" type="string" default=""/>
<cfparam name="url.limit" type="numeric" default="24"/>
<cfparam name="url.offset" type="numeric" default="0"/>
<!--- get a handle to the category service --->
<cfset variables['category_service'] = new root.exercise6.com.example.CategoryService()/>
<!--- get the products in the category --->
<cfset variables['products'] = variables.category_service.getProductsByCategory(
	category=urlDecode(url.category),
	limit=url.limit,
	offset=url.offset
)/>
<!--- get the total products in the category --->
<cfset variables['total_products'] = variables.category_service.getProductsTotalForCategory(
	category=urlDecode(url.category)
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
		<li class="active">Categories</li>
		<li><a href="categories.cfm?category=#urlEncodedFormat(url.category)#">#encodeForHTML(url.category)#</a> (#numberFormat(variables.total_products)# Products)</li>
	</ol>
	<!--- end of breadcrumb --->
	<div class="row">
		<!--- loop over the category products query --->
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
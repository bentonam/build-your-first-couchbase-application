<!--- default url variables --->
<cfparam name="url.limit" type="numeric" default="24"/>
<cfparam name="url.offset" type="numeric" default="0"/>
<!--- get a handle to the product service --->
<cfset variables['product_service'] = new root.exercise7.com.example.ProductService()/>
<!--- get all of the products that recent --->
<cfset variables['recent_products'] = variables.product_service.getRecentProducts(
	limit=url.limit,
	offset=url.offset
)/>
<!--- get the total number of recent products --->
<cfset variables['total_products'] = variables.product_service.getRecentProductsTotal()/>
<!--- get a handle to the utils --->
<cfset variables['utils'] = new root.exercise7.com.example.Utils()/>
<!--- get the pagination based on the results --->
<cfset variables['pagination'] = variables.utils.getPagination(
	limit=url.limit,
	offset=url.offset,
	total=variables.total_products
)/>
<cfoutput>
<!--- start of product listing --->
<div class="product-listing">
	<!--- start of breadcrumb --->
	<ol class="breadcrumb">
		<li><a href="index.cfm">Home</a></li>
		<li class="active"><a href="recent.cfm">New Products</a> (#numberFormat(variables.total_products)# Products)</li>
	</ol>
	<!--- end of breadcrumb --->
	<div class="row">
		<!--- loop over the array of products --->
		<cfloop array="#variables.recent_products#" item="variables.item">
			<!---
				since it is an array of document structures and we want the template to be normalized
				through all results created a normalized structure for the template before including it
			--->
			<cfset variables['product'] = variables.item.document/>
			<cfinclude template="/root/exercise7/view/includes/template.product.cfm"/>
		</cfloop>
	</div>
</div>
<!--- end of product listing --->
<!--- start of pagination --->
<ul class="pagination">
	<cfif variables.pagination.has_previous>
		<li><a href="?offset=#variables.pagination.previous_offset#">«</a></li>
	</cfif>
	<cfloop array="#variables.pagination.pages#" index="variables.page">
		<cfif variables.page.offset eq variables.pagination.current_offset>
			<li class="active"><a>#variables.page.number# <span class="sr-only">(current)</span></a></li>
		<cfelse>
			<li><a href="?offset=#variables.page.offset#">#variables.page.number#</a></li>
		</cfif>
	</cfloop>
	<cfif variables.pagination.has_next>
		<li><a href="?offset=#variables.pagination.next_offset#">»</a></li>
	</cfif>
</ul>
<!--- end of pagination --->
</cfoutput>
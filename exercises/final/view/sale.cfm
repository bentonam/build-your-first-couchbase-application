<!--- default url variables --->
<cfparam name="url.limit" type="numeric" default="24"/>
<cfparam name="url.offset" type="numeric" default="0"/>
<!--- get a handle to the product service --->
<cfset variables['product_service'] = new root.final.com.example.ProductService()/>
<!--- get all of the products that are currently on sale --->
<cfset variables['sale_products'] = variables.product_service.getSaleProducts(limit=url.limit, offset=url.offset)/>
<!--- get a handle to the utils --->
<cfset variables['utils'] = new root.final.com.example.Utils()/>
<!--- get the pagination based on the results --->
<cfset variables['pagination'] = variables.utils.getPagination(limit=url.limit, offset=url.offset, total=variables.sale_products.total)/>
<cfoutput>
<!--- start of product listing --->
<div class="product-listing">
	<!--- start of breadcrumb --->
	<ol class="breadcrumb">
		<li><a href="index.cfm">Home</a></li>
		<li class="active"><a href="sale.cfm">On Sale Products</a></li>
	</ol>
	<!--- end of breadcrumb --->
	<div class="row">
		<cfloop array="#variables.sale_products.results#" index="variables.product">
			<cfinclude template="includes/template.product.cfm"/>
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
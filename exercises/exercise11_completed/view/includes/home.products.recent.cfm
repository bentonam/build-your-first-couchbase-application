<!--- get a handle to the product service --->
<cfset variables['product_service'] = new com.example.ProductService()/>
<!--- get the recent products --->
<cfset variables['recent_products'] = variables.product_service.getRecentProducts(limit=8)/>
<cfoutput>
<div class="product-listing">
	<div class="row headline">
		<h2 class="col-md-8">New Products</h2>
		<div class="col-md-4 text-right">
			 <a class="btn btn-primary" href="recent.cfm">View More</a>
		</div>
	</div>
	<div class="row">
		<!--- loop over the array of products --->
		<cfloop array="#variables.recent_products#" item="variables.product">
			<cfinclude template="template.product.cfm"/>
		</cfloop>
	</div>
</div>
</cfoutput>
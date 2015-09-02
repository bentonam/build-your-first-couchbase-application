<cfset variables['product_service'] = new root.final.com.example.ProductService()/>
<cfset variables['recent_products'] = variables.product_service.getRecentProducts(limit=4)/>
<cfoutput>
<div class="product-listing">
	<div class="row headline">
		<h2 class="col-md-8">New Products</h2>
		<div class="col-md-4 text-right">
			 <a class="btn btn-primary" href="recent.cfm">View More</a>
		</div>
	</div>
	<div class="row">
		<cfloop array="#variables.recent_products.results#" index="variables.product">
			<cfinclude template="/root/final/view/includes/template.product.cfm"/>
		</cfloop>
	</div>
</div>
</cfoutput>
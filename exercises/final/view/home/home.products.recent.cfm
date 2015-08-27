<cfset product_service = new root.org.benton.ProductService()/>
<cfset recent_products = product_service.getRecentProducts(limit=4)/>
<cfoutput>
<div class="product-listing">
	<div class="row headline">
		<h2 class="col-md-8">New Products</h2>
		<div class="col-md-4 text-right">
			 <a class="btn btn-primary" href="recent.cfm">View More</a>
		</div>
	</div>
	<div class="row">
		<cfloop array="#recent_products.results#" index="product">
			<cfinclude template="../includes/result.product.cfm"/>
		</cfloop>
	</div>
</div>
</cfoutput>
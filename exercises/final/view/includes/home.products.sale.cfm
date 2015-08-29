<cfset product_service = new root.org.benton.ProductService()/>
<cfset sale_products = product_service.getSaleProducts(limit=4)/>
<cfoutput>
<div class="product-listing">
	<div class="row headline">
		<h2 class="col-md-8">On Sale Products</h2>
		<div class="col-md-4 text-right">
			 <a class="btn btn-primary" href="sale.cfm">View More</a>
		</div>
	</div>
	<div class="row">
		<cfloop array="#sale_products.results#" index="product">
			<cfinclude template="../includes/result.product.cfm"/>
		</cfloop>
	</div>
</div>
</cfoutput>
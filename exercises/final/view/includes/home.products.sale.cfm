<cfset variables['product_service'] = new root.final.com.example.ProductService()/>
<cfset variables['sale_products'] = variables.product_service.getSaleProducts(limit=4)/>
<cfoutput>
<div class="product-listing">
	<div class="row headline">
		<h2 class="col-md-8">On Sale Products</h2>
		<div class="col-md-4 text-right">
			 <a class="btn btn-primary" href="sale.cfm">View More</a>
		</div>
	</div>
	<div class="row">
		<cfloop array="#variables.sale_products.results#" index="variables.product">
			<cfinclude template="/root/final/view/includes/template.product.cfm"/>
		</cfloop>
	</div>
</div>
</cfoutput>
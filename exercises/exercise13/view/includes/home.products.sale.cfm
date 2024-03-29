<!--- get a handle to the product service --->
<cfset variables['product_service'] = new com.example.ProductService()/>
<!--- get the sale products --->
<cfset variables['sale_products'] = variables.product_service.getSaleProducts(limit=8)/>
<cfoutput>
<div class="product-listing">
	<div class="row headline">
		<h2 class="col-md-8">On Sale Products</h2>
		<div class="col-md-4 text-right">
			 <a class="btn btn-primary" href="sale.cfm">View More</a>
		</div>
	</div>
	<div class="row">
		<!--- loop over the array of products --->
		<cfloop array="#variables.sale_products#" index="variables.product">
			<cfinclude template="template.product.cfm"/>
		</cfloop>
	</div>
</div>
</cfoutput>
<!--- get a handle to the product service --->
<cfset variables['product_service'] = new root.exercise5.com.example.ProductService()/>
<!--- get the recent products --->
<cfset variables['sale_products'] = variables.product_service.getSaleProducts()/>
<cfoutput>
<div class="product-listing">
	<div class="row headline">
		<h2 class="col-md-8">On Sale Products</h2>
	</div>
	<div class="row">
		<!--- loop over the structure of products --->
		<cfloop collection="#variables.sale_products#" item="variables.product_id">
			<!---
				since it is a structure and we want the template to be normalized through all results
				created a normalized structure for the template before including it
			--->
			<cfset variables['product'] = variables.sale_products[variables.product_id]/>
			<cfinclude template="template.product.cfm"/>
		</cfloop>
	</div>
</div>
</cfoutput>
<cfoutput>
<div class="product-listing">
	<div class="row headline">
		<h2 class="col-md-8">On Sale Products</h2>
		<div class="col-md-4 text-right">
			 <a class="btn btn-primary" href="sale.cfm">View More</a>
		</div>
	</div>
	<div class="row">
		<cfloop from="1" to="8" index="variables.i">
			<cfinclude template="/root/exercise1/view/includes/template.product.cfm"/>
		</cfloop>
	</div>
</div>
</cfoutput>
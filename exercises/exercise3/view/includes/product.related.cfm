<cfoutput>
<div class="product-listing">
	<div class="row">
		<cfloop from="1" to="8" index="variables.i">
			<cfinclude template="/root/exercise3/view/includes/template.product.cfm"/>
		</cfloop>
	</div>
</div>
</cfoutput>
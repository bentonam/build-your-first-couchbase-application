<cfoutput>
<div class="product-listing">
	<div class="row">
		<cfloop from="1" to="8" index="variables.i">
			<cfinclude template="/root/exercise3_completed/view/includes/result.product.cfm"/>
		</cfloop>
	</div>
</div>
</cfoutput>
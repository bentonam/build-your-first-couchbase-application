<cfoutput>
<div class="product-listing">
	<div class="row">
		<cfloop array="#variables.related.results#" index="product">
			<cfinclude template="/root/view/includes/result.product.cfm"/>
		</cfloop>
	</div>
</div>
</cfoutput>
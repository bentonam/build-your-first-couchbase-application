<cfoutput>
<div class="product-listing">
	<div class="row">
		<cfloop array="#variables.related.results#" index="variables.product">
			<cfinclude template="/root/final/view/includes/template.product.cfm"/>
		</cfloop>
	</div>
</div>
</cfoutput>
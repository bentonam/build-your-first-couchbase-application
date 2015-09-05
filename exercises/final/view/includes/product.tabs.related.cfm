<cfoutput>
<div class="product-listing">
	<div class="row">
		<cfloop array="#variables.related#" index="variables.product">
			<cfinclude template="template.product.cfm"/>
		</cfloop>
	</div>
</div>
</cfoutput>
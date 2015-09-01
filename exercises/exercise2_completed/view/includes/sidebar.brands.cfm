<cfoutput>
<p class="lead">Brands</p>
<div class="list-group">
	<cfloop array="#variables.site_brands#" index="variables.brand">
		<a href="brands.cfm?brand=#urlEncodedFormat(variables.brand.name)#" class="list-group-item">#variables.brand.name#</a>
	</cfloop>
</div>
</cfoutput>
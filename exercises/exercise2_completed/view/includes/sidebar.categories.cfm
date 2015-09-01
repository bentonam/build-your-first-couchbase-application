<cfoutput>
<p class="lead">Categories</p>
<div class="list-group">
	<cfloop array="#variables.site_categories#" index="variables.category">
		<a href="categories.cfm?category=#urlEncodedFormat(variables.category.name)#" class="list-group-item">#variables.category.name#</a>
	</cfloop>
</div>
</cfoutput>
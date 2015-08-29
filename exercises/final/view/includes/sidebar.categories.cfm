<cfoutput>
<p class="lead">Categories</p>
<div class="list-group">
	<cfloop from="1" to="#variables.site_categories.count#" index="i">
		<a href="categories.cfm?category=#urlEncodedFormat(site_categories.results[i].key)#" class="list-group-item">#variables.site_categories.results[i].key# <span class="badge">#numberFormat(site_categories.results[i].value)#</span></a>
	</cfloop>
</div>
</cfoutput>
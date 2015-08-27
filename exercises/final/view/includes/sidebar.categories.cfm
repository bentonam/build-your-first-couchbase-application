<cfset categories = new root.org.benton.site.Categories()/>
<cfset site_categories = categories.getSiteCategories()/>
<cfoutput>
<p class="lead">Categories</p>
<div class="list-group">
	<cfloop from="1" to="#site_categories.count#" index="i">
		<a href="categories.cfm?category=#urlEncodedFormat(site_categories.results[i].key)#" class="list-group-item">#site_categories.results[i].key# <span class="badge">#numberFormat(site_categories.results[i].value)#</span></a>
	</cfloop>
</div>
</cfoutput>
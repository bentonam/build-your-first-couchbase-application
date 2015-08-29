<cfoutput>
<p class="lead">Brands</p>
<div class="list-group">
	<cfloop from="1" to="#site_brands.count#" index="i">
		<a href="brands.cfm?brand=#urlEncodedFormat(site_brands.results[i].key)#" class="list-group-item">#site_brands.results[i].key# <span class="badge">#site_brands.results[i].value#</span></a>
	</cfloop>
</div>
</cfoutput>
<cfoutput>
<p class="lead">Categories</p>
<div class="list-group">
	<cfloop from="1" to="10" index="variables.i">
		<a href="categories.cfm" class="list-group-item">Category #variables.i# <span class="badge">#numberFormat(randRange(100, 2000))#</span></a>
	</cfloop>
</div>
</cfoutput>
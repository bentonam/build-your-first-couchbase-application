<cfoutput>
<p class="lead">Brands</p>
<div class="list-group">
	<cfloop from="1" to="25" index="variables.i">
		<a href="brands.cfm" class="list-group-item">Brand #variables.i# <span class="badge">#randRange(25, 1000)#</span></a>
	</cfloop>
</div>
</cfoutput>
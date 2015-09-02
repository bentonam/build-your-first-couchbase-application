<!--- get a handle to the category service --->
<cfset variables['category_service'] = new root.exercise6_completed.com.example.CategoryService()/>
<!--- get the categories --->
<cfset variables['site_categories'] = variables.category_service.getCategories()/>
<cfoutput>
<p class="lead">Categories</p>
<div class="list-group">
	<cfloop array="#variables.site_categories#" index="variables.category">
		<a href="categories.cfm?category=#urlEncodedFormat(variables.category.key)#" class="list-group-item">#variables.category.key# <span class="badge">#numberFormat(variables.category.value)#</span></a>
	</cfloop>
</div>
</cfoutput>
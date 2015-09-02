<!--- get a handle to the brand service --->
<cfset variables['brand_service'] = new root.exercise5.com.example.BrandService()/>
<!--- get the categories --->
<cfset variables['categories'] = variables.brand_service.getBrands()/>
<cfoutput>
<p class="lead">Brand</p>
<div class="list-group">
	<cfloop array="#variables.categories#" index="variables.brand">
		<a href="brands.cfm?brand=#urlEncodedFormat(variables.brand.key)#" class="list-group-item">#variables.brand.key# <span class="badge">#numberFormat(variables.brand.value)#</span></a>
	</cfloop>
</div>
</cfoutput>
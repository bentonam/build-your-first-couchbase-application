<!--- get a handle to the brand service --->
<cfset variables['brand_service'] = new root.exercise7_completed.com.example.BrandService()/>
<!--- get the site brands --->
<cfset variables['site_brands'] = variables.brand_service.getBrands()/>
<cfoutput>
<p class="lead">Brand</p>
<div class="list-group">
	<cfloop array="#variables.site_brands#" index="variables.brand">
		<a href="brands.cfm?brand=#urlEncodedFormat(variables.brand.key)#" class="list-group-item">#variables.brand.key# <span class="badge">#numberFormat(variables.brand.value)#</span></a>
	</cfloop>
</div>
</cfoutput>
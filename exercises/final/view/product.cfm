<!--- default url variables --->
<cfparam name="url.slug" type="string" default=""/>
<!--- get a handle to the product service --->
<cfset variables['product_service'] = new root.org.benton.ProductService()/>
<!--- get the product details by the url slug --->
<cfset variables['product'] = variables.product_service.getProductBySlug(slug=url.slug)/>
<cfoutput>
<cfif variables.product.found>
	<div class="product-detail">
		<!--- start of breadcrumb --->
		<ol class="breadcrumb">
			<li><a href="index.cfm">Home</a></li>
			<li><a href="categories.cfm?category=#urlEncodedFormat(variables.product.document.getCategory())#">#variables.product.document.getCategory()#</a></li>
			<li class="active">#variables.product.document.getTitle()#</li>
		</ol>
		<!--- end of breadcrumb --->
		<div class="row">
			<!--- start of images --->
			<div class="col-sm-12 col-md-5">
				<cfinclude template="includes/product.images.cfm"/>
			</div>
			<!--- end of images --->
			<!--- start of info --->
			<div class="col-sm-12 col-md-7">
				<cfinclude template="includes/product.info.cfm"/>
			</div>
			<!--- end of info --->
		</div>
		<!--- start of tabs --->
		<div class="row">
			<div class="col-md-12">
				<cfinclude template="includes/product.tabs.cfm"/>
			</div>
		</div>
		<!--- end of tabs --->
	</div>
<cfelse>
	<p class="alert alert-danger" role="alert">
		<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
		The product could not be found.
	</p>
</cfif>
</cfoutput>
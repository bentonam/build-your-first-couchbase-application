<!--- default url variables --->
<cfparam name="url.slug" type="string" default=""/>
<cfparam name="url.limit" type="numeric" default="5"/>
<cfparam name="url.offset" type="numeric" default="0"/>
<!--- get --->
<cfset variables['product_service'] = new com.example.ProductService()/>
<!--- get the product details by the url slug --->
<cfset variables['product'] = variables.product_service.getProductBySlug(slug=url.slug)/>
<cfoutput>
<!--- output the product details if the product has a document --->
<cfif structKeyExists(variables.product, "document")>
	<div class="product-detail">
		<!--- start of breadcrumb --->
		<ol class="breadcrumb">
			<li><a href="index.cfm">Home</a></li>
			<li><a href="categories.cfm?category=#urlEncodedFormat(variables.product.document.getCategory())#">#variables.product.document.getCategory()#</a></li>
			<li><a href="product.cfm?slug=#variables.product.document.getSlug()#">#variables.product.document.getTitle()#</a></li>
			<li class="active">Reviews</li>
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
				<!--- get the reviews --->
				<cfset variables['reviews'] = variables.product.document.getReviews(limit=url.limit, offset=url.offset)/>
				<!--- get the pagination based on the results --->
				<cfset variables['utils'] = new com.example.Utils()/>
				<cfset variables['pagination'] = variables.utils.getPagination(limit=url.limit, offset=url.offset, total=variables.product.document.getReviewTotal())/>
				<cfinclude template="includes/product.tabs.reviews.cfm"/>
			</div>
		</div>
		<!--- end of tabs --->
		<!--- start of pagination --->
		<ul class="pagination">
			<cfif pagination.has_previous>
				<li><a href="?slug=#variables.product.document.getSlug()#&offset=#variables.pagination.previous_offset#">«</a></li>
			</cfif>
			<cfloop array="#variables.pagination.pages#" index="variables.page">
				<cfif variables.page.offset eq variables.pagination.current_offset>
					<li class="active"><a>#variables.page.number# <span class="sr-only">(current)</span></a></li>
				<cfelse>
					<li><a href="?slug=#variables.product.document.getSlug()#&offset=#variables.page.offset#">#variables.page.number#</a></li>
				</cfif>
			</cfloop>
			<cfif pagination.has_next>
				<li><a href="?slug=#variables.product.document.getSlug()#&offset=#variables.pagination.next_offset#">»</a></li>
			</cfif>
		</ul>
		<!--- end of pagination --->
	</div>
<cfelse>
	<p class="alert alert-danger" role="alert">
		<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
		The product could not be found.
	</p>
</cfif>
</cfoutput>
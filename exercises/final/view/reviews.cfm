<!--- default url variables --->
<cfparam name="url.slug" type="string" default=""/>
<cfparam name="url.limit" type="numeric" default="5"/>
<cfparam name="url.offset" type="numeric" default="0"/>
<!--- get --->
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
				<cfset utils = new root.org.benton.Utils()/>
				<cfset pagination = utils.getPagination(limit=url.limit, offset=url.offset, total=reviews.total)/>
				<cfinclude template="includes/product.reviews.cfm"/>
			</div>
		</div>
		<!--- end of tabs --->
		<!--- start of pagination --->
		<ul class="pagination">
			<cfif pagination.has_previous>
				<li><a href="?slug=#variables.product.document.getSlug()#&offset=#pagination.previous_offset#">«</a></li>
			</cfif>
			<cfloop array="#pagination.pages#" index="page">
				<cfif page.offset eq pagination.current_offset>
					<li class="active"><a>#page.number# <span class="sr-only">(current)</span></a></li>
				<cfelse>
					<li><a href="?slug=#variables.product.document.getSlug()#&offset=#page.offset#">#page.number#</a></li>
				</cfif>
			</cfloop>
			<cfif pagination.has_next>
				<li><a href="?slug=#variables.product.document.getSlug()#&offset=#pagination.next_offset#">»</a></li>
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
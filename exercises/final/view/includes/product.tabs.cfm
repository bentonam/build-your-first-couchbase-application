<!--- get the reviews --->
<cfset variables['reviews'] = variables.product.document.getReviews(limit=2)/>
<!--- get the related products --->
<cfset variables['related'] = variables.product.document.getRelatedProducts()/>
<cfoutput>
<ul class="nav nav-tabs nav_tabs">
	<li class="active"><a href="##description" data-toggle="tab">Description</a></li>
	<li><a href="##reviews" data-toggle="tab">Reviews</a></li>
	<li><a href="##related" data-toggle="tab">Related</a></li>
</ul>
<div class="tab-content">
	<div class="tab-pane fade in active" id="description">
		#variables.product.document.getLong_Description()#
	</div>
	<div class="tab-pane fade" id="reviews">
		<cfinclude template="product.tabs.reviews.cfm"/>
		<!--- only show the more button if there is more than 2 reviews --->
		<cfif variables.product.document.getReviewTotal() gt 2>
			<a class="btn btn-primary" href="reviews.cfm?slug=#variables.product.document.getSlug()#">View More</a>
		</cfif>
	</div>
	<div class="tab-pane fade" id="related">
		<cfinclude template="product.tabs.related.cfm"/>
	</div>
</div>
</cfoutput>
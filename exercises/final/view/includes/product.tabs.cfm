<cfoutput>
<!--- get the related products --->
<cfset variables['related'] = variables.product.document.getRelatedProducts()/>
<!--- get the reviews --->
<cfset variables['reviews'] = variables.product.document.getReviews(limit=2)/>
<ul class="nav nav-tabs nav_tabs">
	<li class="active"><a href="##description" data-toggle="tab">Description</a></li>
	<li><a href="##reviews" data-toggle="tab">Reviews</a></li>
	<!--- only show related if there is actually related products --->
	<cfif variables.related.count>
		<li><a href="##related" data-toggle="tab">Related</a></li>
	</cfif>
</ul>
<div class="tab-content">
	<div class="tab-pane fade in active" id="description">
		#variables.product.document.getLong_Description()#
	</div>
	<div class="tab-pane fade" id="reviews">
		<cfinclude template="/root/final/view/includes/product.reviews.cfm"/>
		<a class="btn btn-primary" href="reviews.cfm?slug=#variables.product.document.getSlug()#">View More</a>
	</div>
	<!--- only show related if there is actually related products --->
	<cfif variables.related.count>
		<div class="tab-pane fade" id="related">
			<cfinclude template="/root/final/view/includes/product.related.cfm"/>
		</div>
	</cfif>
</div>
</cfoutput>
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
	</div>
	<div class="tab-pane fade" id="related">
		<cfinclude template="product.tabs.related.cfm"/>
	</div>
</div>
</cfoutput>
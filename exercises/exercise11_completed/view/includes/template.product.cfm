<cfoutput>
<div class="col-xs-6 col-sm-4 col-md-4 col-lg-3">
	<div class="thumbnail">
		<img src="#product.document.getImage()#" class="img-responsive">
		<div class="caption">
			<h3><a href="product.cfm?slug=#product.document.getSlug()#">#product.document.getTitle()#</a></h3>
			<p>#product.document.getShort_Description()#</p>
			<div class="row">
				<div class="col-md-6 price">
					<cfif product.document.isOnSale()>
						<h4 class="sale">#dollarFormat(product.document.getSale_Price())# <strike>#dollarFormat(product.document.getPrice())#</strike></h4>
					<cfelse>
						<h4>#dollarFormat(product.document.getPrice())#</h4>
					</cfif>
				</div>
				<div class="col-md-6">
					<a href="product.cfm?slug=#product.document.getSlug()#" class="btn btn-success btn-block"><span class="glyphicon glyphicon-shopping-cart"></span> Buy</a>
				</div>
			</div>
			<div class="ratings clearfix">
				<cfset variables['rating'] = product.document.getAverageReviewRating()/>
				<div class="stars pull-left" data-rating="#rating#">
					<span class="glyphicon glyphicon-star<cfif variables.rating lte 1>-empty</cfif>"></span>
					<span class="glyphicon glyphicon-star<cfif variables.rating lte 2>-empty</cfif>"></span>
					<span class="glyphicon glyphicon-star<cfif variables.rating lte 3>-empty</cfif>"></span>
					<span class="glyphicon glyphicon-star<cfif variables.rating lte 4>-empty</cfif>"></span>
					<span class="glyphicon glyphicon-star<cfif variables.rating lte 5>-empty</cfif>"></span>
				</div>
				<div class="rating pull-right">
					#product.document.getReviewTotal()# reviews
				</div>
			</div>
		</div>
	</div>
</div>
</cfoutput>
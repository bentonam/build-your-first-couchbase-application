<!--- get the review aggregate totals --->
<cfset variables['review_aggregates'] = variables.product.document.getReviewAggregates()/>
<cfoutput>
<div class="row">
	<!--- start of reviews --->
	<div class="col-md-8">
		<cfloop array="#variables.reviews#" index="variables.review">
			<div class="review">
				<h4>#variables.review.document.getReview_Title()#</h4>
				<div class="row">
					<div class="col-md-5">
						<b>#variables.review.document.getReviewer_name()#</b>
						<time class="text-muted"><em>#variables.review.document.getReviewDateFormatted()#</em></time>
					</div>
					<div class="col-md-7">
						<div class="ratings clearfix">
							<cfset variables['rating'] = variables.review.document.getRating()/>
							<div class="stars pull-right">
								<span class="glyphicon glyphicon-star<cfif variables.rating lte 1>-empty</cfif>"></span>
								<span class="glyphicon glyphicon-star<cfif variables.rating lte 2>-empty</cfif>"></span>
								<span class="glyphicon glyphicon-star<cfif variables.rating lte 3>-empty</cfif>"></span>
								<span class="glyphicon glyphicon-star<cfif variables.rating lte 4>-empty</cfif>"></span>
								<span class="glyphicon glyphicon-star<cfif variables.rating lte 5>-empty</cfif>"></span>
							</div>
						</div>
					</div>
				</div>
				#variables.review.document.getReview_Body()#
			</div>
		</cfloop>
	</div>
	<!--- end of reviews --->
	<!--- start of overall ratings --->
	<div class="col-md-4">
		<p class="lead">Overall Rating (#variables.product.document.getReviewTotal()# reviews)</p>
		<ul class="list-group">
			<li class="list-group-item">
				<span class="stars">
					<span class="glyphicon glyphicon-star"></span>
					<span class="glyphicon glyphicon-star"></span>
					<span class="glyphicon glyphicon-star"></span>
					<span class="glyphicon glyphicon-star"></span>
					<span class="glyphicon glyphicon-star"></span>
				</span>
				<span class="badge">#variables.review_aggregates[5]#</span>
			</li>
			<li class="list-group-item">
				<span class="stars">
					<span class="glyphicon glyphicon-star"></span>
					<span class="glyphicon glyphicon-star"></span>
					<span class="glyphicon glyphicon-star"></span>
					<span class="glyphicon glyphicon-star"></span>
					<span class="glyphicon glyphicon-star-empty"></span>
				</span>
				<span class="badge">#variables.review_aggregates[4]#</span>
			</li>
			<li class="list-group-item">
				<span class="stars">
					<span class="glyphicon glyphicon-star"></span>
					<span class="glyphicon glyphicon-star"></span>
					<span class="glyphicon glyphicon-star"></span>
					<span class="glyphicon glyphicon-star-empty"></span>
					<span class="glyphicon glyphicon-star-empty"></span>
				</span>
				<span class="badge">#variables.review_aggregates[3]#</span>
			</li>
			<li class="list-group-item">
				<span class="stars">
					<span class="glyphicon glyphicon-star"></span>
					<span class="glyphicon glyphicon-star"></span>
					<span class="glyphicon glyphicon-star-empty"></span>
					<span class="glyphicon glyphicon-star-empty"></span>
					<span class="glyphicon glyphicon-star-empty"></span>
				</span>
				<span class="badge">#variables.review_aggregates[2]#</span>
			</li>
			<li class="list-group-item">
				<span class="stars">
					<span class="glyphicon glyphicon-star"></span>
					<span class="glyphicon glyphicon-star-empty"></span>
					<span class="glyphicon glyphicon-star-empty"></span>
					<span class="glyphicon glyphicon-star-empty"></span>
					<span class="glyphicon glyphicon-star-empty"></span>
				</span>
				<span class="badge">#variables.review_aggregates[1]#</span>
			</li>
		</ul>
	</div>
	<!--- end of overall ratings --->
</div>
</cfoutput>
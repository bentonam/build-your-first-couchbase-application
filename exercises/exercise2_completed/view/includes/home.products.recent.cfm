<cfoutput>
<div class="product-listing">
	<div class="row headline">
		<h2 class="col-md-8">New Products</h2>
		<div class="col-md-4 text-right">
			 <a class="btn btn-primary" href="recent.cfm">View More</a>
		</div>
	</div>
	<div class="row">
		<cfloop from="1" to="4" index="i">
			<div class="col-xs-6 col-sm-4 col-md-4 col-lg-3">
				<div class="thumbnail">
					<img src="http://placehold.it/200" class="img-responsive">
					<div class="caption">
						<h3><a href="##">Lorem ipsum dolor sit amet</a></h3>
						<p>Pellentesque imperdiet neque blandit libero tincidunt facilisis</p>
						<div class="row">
							<div class="col-md-6 price">
								<h4 class="sale">$530.98 <strike>$630.64</strike></h4>
							</div>
							<div class="col-md-6">
								<a href="##" class="btn btn-success btn-block"><span class="glyphicon glyphicon-shopping-cart"></span> Buy</a>
							</div>
						</div>
						<div class="ratings clearfix">
							<div class="stars pull-left">
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
							</div>
							<div class="rating pull-right">
								15 reviews
							</div>
						</div>
					</div>
				</div>
			</div>
		</cfloop>
	</div>
</div>
</cfoutput>
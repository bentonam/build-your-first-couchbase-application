<cfoutput>
<div class="col-xs-6 col-sm-4 col-md-4 col-lg-3">
	<div class="thumbnail">
		<img src="http://placehold.it/200" class="img-responsive">
		<div class="caption">
			<h3><a href="product.cfm">Lorem ipsum dolor sit amet</a></h3>
			<p>Pellentesque imperdiet neque blandit libero tincidunt facilisis</p>
			<div class="row">
				<div class="col-md-6 price">
					<h4>#dollarFormat(randRange(10, 1000))#</h4>
				</div>
				<div class="col-md-6">
					<a href="product.cfm" class="btn btn-success btn-block"><span class="glyphicon glyphicon-shopping-cart"></span> Buy</a>
				</div>
			</div>
			<div class="ratings clearfix">
				<div class="stars pull-left">
					<span class="glyphicon glyphicon-star"></span>
					<span class="glyphicon glyphicon-star"></span>
					<span class="glyphicon glyphicon-star"></span>
					<span class="glyphicon glyphicon-star"></span>
					<span class="glyphicon glyphicon-star-empty"></span>
				</div>
				<div class="rating pull-right">
					#randRange(1, 25)# reviews
				</div>
			</div>
		</div>
	</div>
</div>
</cfoutput>
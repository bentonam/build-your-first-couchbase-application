<cfoutput>
<a href="##" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	<span class="glyphicon glyphicon-shopping-cart"></span> 5 items<span class="caret"></span>
</a>
<ul class="dropdown-menu dropdown-cart" role="menu">
	<cfloop from="1" to="5" index="variables.i">
		<li>
			<a href="product.cfm" class="row">
				<div class="col-md-3">
					<img src="http://placehold.it/100" class="img-responsive">
				</div>
				<div class="col-md-9">
					<h5>Infringed Waggonage Sweet Unsuperfluous </h5>
					<div class="row">
						<h6 class="col-md-6">$9.99 x 10</h6>
						<h6 class="col-md-6 text-right">$99.99</h6>
					</div>
				</div>
			</a>
		</li>
	</cfloop>
	<li class="divider"></li>
	<li class="text-right sub-total">
		<b>Sub Total:</b> $499.50
	</li>
	<li>
		<div>
			<a class="btn btn-primary btn-block btn-lg" href="cart.cfm">View Cart</a>
		</div>
	</li>
</ul>
</cfoutput>
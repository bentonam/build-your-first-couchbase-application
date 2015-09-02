<cfoutput>
<div class="col-xs-6 col-sm-4 col-md-4 col-lg-3">
	<div class="thumbnail">
		<img src="#variables.product.image#" class="img-responsive">
		<div class="caption">
			<h3><a href="product.cfm?slug=#variables.product.slug#">#variables.product.title#</a></h3>
			<p>#variables.product.short_description#</p>
			<div class="row">
				<div class="col-md-6 price">
					<cfif variables.product.sale_price and variables.product.sale_price lt variables.product.price>
						<h4 class="sale">#dollarFormat(variables.product.sale_price)# <strike>#dollarFormat(variables.product.price)#</strike></h4>
					<cfelse>
						<h4>#dollarFormat(variables.product.price)#</h4>
					</cfif>
				</div>
				<div class="col-md-6">
					<a href="product.cfm?slug=#variables.product.slug#" class="btn btn-success btn-block"><span class="glyphicon glyphicon-shopping-cart"></span> Buy</a>
				</div>
			</div>
		</div>
	</div>
</div>
</cfoutput>
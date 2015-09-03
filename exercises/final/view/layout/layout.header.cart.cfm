<!--- get a handle to the cart service --->
<cfset variables['cart_service'] = new com.example.CartService()/>
<!--- set the cart --->
<cfset variables.cart_service.setCart(data=form)/>
<!--- get the cart --->
<cfset variables['cart'] = variables.cart_service.getCart()/>
<!--- get the line items in the cart --->
<cfset variables['line_items'] = variables.cart.document.getLine_Items()/>
<cfoutput>
<a href="##" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	<span class="glyphicon glyphicon-shopping-cart"></span> #variables.cart.document.getLineItemTotal()# items<span class="caret"></span>
</a>
<ul class="dropdown-menu dropdown-cart" role="menu">
	<cfloop collection="#variables.line_items#" item="variables.product_id">
		<li>
			<a href="product.cfm?slug=#variables.line_items[variables.product_id].slug#" class="row">
				<div class="col-md-3">
					<img src="#variables.line_items[variables.product_id].image#" class="img-responsive">
				</div>
				<div class="col-md-9">
					<h5>#variables.line_items[variables.product_id].title#</h5>
					<div class="row">
						<h6 class="col-md-6">#dollarFormat(variables.line_items[variables.product_id].price)# x #variables.line_items[variables.product_id].qty#</h6>
						<h6 class="col-md-6 text-right">#dollarFormat(variables.line_items[variables.product_id].sub_total)#</h6>
					</div>
				</div>
			</a>
		</li>
	</cfloop>
	<li class="divider"></li>
	<li class="text-right sub-total">
		<b>Sub Total:</b> #dollarFormat(variables.cart.document.getSub_Total())#
	</li>
	<li>
		<div>
			<a class="btn btn-primary btn-block btn-lg" href="cart.cfm">View Cart</a>
		</div>
	</li>
</ul>
</cfoutput>
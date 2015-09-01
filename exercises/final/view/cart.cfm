<!--- get a handle to the cart service --->
<cfset variables['cart_service'] = new root.final.com.benton.CartService()/>
<!--- the card / add / update / remove is handled in view/includes/layout.header.cart.cfm --->
<!--- get the cart --->
<cfset variables['cart'] = variables.cart_service.getCart()/>
<!--- get the line items in the cart --->
<cfset variables['line_items'] = variables.cart.document.getLine_Items()/>
<cfoutput>
<form action="cart.cfm" method="post">
	<!--- start of breadcrumb --->
	<ol class="breadcrumb">
		<li><a href="index.cfm">Home</a></li>
		<li class="active">Cart</li>
	</ol>
	<!--- end of breadcrumb --->
	<cfif not structIsEmpty(variables.line_items)>
		<!--- start of cart --->
		<table id="cart" class="table table-hover table-condensed">
			<thead class="hidden-xs">
				<tr>
					<th>Product</th>
					<th>Price</th>
					<th>Quantity</th>
					<th class="text-center">Subtotal</th>
					<th></th>
				</tr>
			</thead>
			<!--- start of line items --->
			<tbody>
				<cfloop collection="#variables.line_items#" item="variables.product_id">
					<tr>
						<td data-th="Product">
							<div class="row">
								<div class="col-sm-3 hidden-xs">
									<a href="product.cfm?slug=#variables.line_items[variables.product_id].slug#">
										<img src="#variables.line_items[variables.product_id].image#" class="img-responsive">
									</a>
								</div>
								<div class="col-sm-9">
									<h4 class="nomargin">
										<a href="product.cfm?slug=#variables.line_items[variables.product_id].slug#">
											#variables.line_items[variables.product_id].title#
										</a>
									</h4>
									<p>#variables.line_items[variables.product_id].short_description#</p>
								</div>
							</div>
						</td>
						<td data-th="Price">#dollarFormat(variables.line_items[variables.product_id].price)#</td>
						<td data-th="Quantity">
							<input type="hidden" name="product_id" value="#variables.product_id#">
							<input type="number" step="1" min="1" name="#variables.product_id#_qty" class="form-control text-center" value="#variables.line_items[variables.product_id].qty#">
						</td>
						<td data-th="Subtotal" class="text-center">#dollarFormat(variables.line_items[variables.product_id].sub_total)#</td>
						<td class="actions" data-th="">
							<button class="btn btn-info pull-left" type="submit"><i class="glyphicon glyphicon-refresh"></i> <span class="sr-only"> Update</span></button>
							<button class="btn btn-danger pull-right" type="submit" name="remove_product_id" value="#variables.product_id#"><i class="glyphicon glyphicon-trash"></i> <span class="sr-only"> Remove</span></button>
						</td>
					</tr>
				</cfloop>
			</tbody>
			<!--- end of line items --->
			<!--- start of totals --->
			<tfoot>
				<tr class="visible-xs">
					<td class="text-center"><strong>Total #dollarFormat(variables.cart.document.getSub_Total())#</strong></td>
				</tr>
				<tr>
					<td><a href="index.cfm" class="btn btn-warning"><i class="glyphicon glyphicon-menu-left"></i> Continue Shopping</a></td>
					<td colspan="2" class="hidden-xs"></td>
					<td class="hidden-xs text-center"><strong>#dollarFormat(variables.cart.document.getSub_Total())#</strong></td>
					<td><a href="checkout.cfm" class="btn btn-success btn-block">Checkout <i class="glyphicon glyphicon-menu-right"></i></a></td>
				</tr>
			</tfoot>
			<!--- end of totals --->
		</table>
		<!--- end of cart --->
	<cfelse>
		<p class="alert alert-warning">
			<i class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></i>
			There are no items in your cart
		</p>
	</cfif>
	<!--- output the cart document id for debugging purposes --->
	<p><b>Cart Document ID:</b> #variables.cart.document.getCart_ID()#</p>
</form>
</cfoutput>
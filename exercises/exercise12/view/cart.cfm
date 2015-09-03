<cfoutput>
<form action="cart.cfm" method="post">
	<!--- start of breadcrumb --->
	<ol class="breadcrumb">
		<li><a href="index.cfm">Home</a></li>
		<li class="active">Cart</li>
	</ol>
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
			<cfloop from="1" to="5" index="variables.i">
				<tr>
					<td data-th="Product">
						<div class="row">
							<div class="col-sm-3 hidden-xs">
								<a href="product.cfm">
									<img src="http://placehold.it/200" class="img-responsive">
								</a>
							</div>
							<div class="col-sm-9">
								<h4 class="nomargin">
									<a href="product.cfm">
										Lorem ipsum dolor sit amet
									</a>
								</h4>
								<p>Pellentesque imperdiet neque blandit libero tincidunt facilisis</p>
							</div>
						</div>
					</td>
					<td data-th="Price">#dollarFormat(randRange(50, 1000))#</td>
					<td data-th="Quantity">
						<input type="hidden" name="product_id" value="">
						<input type="number" step="1" min="1" name="product_id_qty" class="form-control text-center" value="#randRange(1, 5)#">
					</td>
					<td data-th="Subtotal" class="text-center">#dollarFormat(randRange(100, 1000))#</td>
					<td class="actions" data-th="">
						<button class="btn btn-info pull-left" type="submit"><i class="glyphicon glyphicon-refresh"></i> <span class="sr-only"> Update</span></button>
						<button class="btn btn-danger pull-right" type="submit" name="remove_product_id" value=""><i class="glyphicon glyphicon-trash"></i> <span class="sr-only"> Remove</span></button>
					</td>
				</tr>
			</cfloop>
		</tbody>
		<!--- end of line items --->
		<!--- start of totals --->
		<tfoot>
			<tr class="visible-xs">
				<td class="text-center"><strong>Total #dollarFormat(randRange(500, 5000))#</strong></td>
			</tr>
			<tr>
				<td><a href="index.cfm" class="btn btn-warning"><i class="glyphicon glyphicon-menu-left"></i> Continue Shopping</a></td>
				<td colspan="2" class="hidden-xs"></td>
				<td class="hidden-xs text-center"><strong>#dollarFormat(randRange(500, 5000))#</strong></td>
				<td><a href="checkout.cfm" class="btn btn-success btn-block">Checkout <i class="glyphicon glyphicon-menu-right"></i></a></td>
			</tr>
		</tfoot>
		<!--- end of totals --->
	</table>
	<!--- end of cart --->
</form>
</cfoutput>
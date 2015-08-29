<cfoutput>
<!--- start of cart --->
<table id="cart" class="table table-hover table-condensed">
	<thead class="hidden-xs">
		<tr>
			<th>Product</th>
			<th>Price</th>
			<th>Quantity</th>
			<th class="text-center">Subtotal</th>
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
				<td data-th="Quantity" class="text-center">
					#variables.line_items[variables.product_id].qty#
				</td>
				<td data-th="Subtotal" class="text-center">#dollarFormat(variables.line_items[variables.product_id].sub_total)#</td>
			</tr>
		</cfloop>
	</tbody>
	<!--- end of line items --->
</table>
</cfoutput>
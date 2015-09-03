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
				<td data-th="Quantity" class="text-center">
					#randRange(1, 5)#
				</td>
				<td data-th="Subtotal" class="text-center">#dollarFormat(randRange(100, 1000))#</td>
			</tr>
		</cfloop>
	</tbody>
	<!--- end of line items --->
</table>
</cfoutput>
<cfoutput>
<form action="cart.cfm" method="post">
<table id="cart" class="table table-hover table-condensed">
	<thead class="hidden-xs">
		<tr>
			<th style="">Product</th>
			<th style="">Price</th>
			<th style="">Quantity</th>
			<th style="" class="text-center">Subtotal</th>
			<th style=""></th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td data-th="Product">
				<div class="row">
					<div class="col-sm-3 hidden-xs"><img src="http://placehold.it/100x100" class="img-responsive"/></div>
					<div class="col-sm-9">
						<h4 class="nomargin">Product 1</h4>
						<p>Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor sit amet.</p>
					</div>
				</div>
			</td>
			<td data-th="Price">$1.99</td>
			<td data-th="Quantity">
				<input type="number" step="1" min="1" class="form-control text-center" value="1">
			</td>
			<td data-th="Subtotal" class="text-center">$120.99</td>
			<td class="actions" data-th="">
				<button class="btn btn-danger pull-right"><i class="glyphicon glyphicon-trash"></i> Remove</button>
			</td>
		</tr>
	</tbody>
	<tfoot>
		<tr class="visible-xs">
			<td class="text-center"><strong>Total $1,222.99</strong></td>
		</tr>
		<tr>
			<td><a href="##" class="btn btn-warning"><i class="glyphicon glyphicon-menu-left"></i> Continue Shopping</a></td>
			<td colspan="2" class="hidden-xs"></td>
			<td class="hidden-xs text-center"><strong>$1,222.99</strong></td>
			<td><a href="##" class="btn btn-success btn-block">Checkout <i class="glyphicon glyphicon-menu-right"></i></a></td>
		</tr>
	</tfoot>
</table>
</cfoutput>
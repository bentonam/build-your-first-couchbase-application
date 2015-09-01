<cfoutput>
<h1>Lorem ipsum dolor sit amet</h1>
<p>Pellentesque imperdiet neque blandit libero tincidunt facilisis</p>
<!--- start of star ratings / reviews --->
<div class="ratings clearfix">
	<div class="stars pull-left">
		<span class="glyphicon glyphicon-star"></span>
		<span class="glyphicon glyphicon-star"></span>
		<span class="glyphicon glyphicon-star"></span>
		<span class="glyphicon glyphicon-star"></span>
		<span class="glyphicon glyphicon-star-empty"></span>
	</div>
	<div class="rating">
		#randRange(1, 25)# reviews
	</div>
</div>
<!--- end of star ratings / reviews --->
<hr />
<!--- start of price --->
<h3 class="price sale">#dollarFormat(randRange(20, 1000))# <strike>#dollarFormat(randRange(20, 1000))#</strike></h3>
<!--- end of price --->
<!--- start of availability --->
<h4 class="availability in-stock">In-Stock</h4>
<!--- end of availability --->
<!--- start of add to cart form --->
<hr />
<form class="form-inline" action="cart.cfm" method="post">
	<input type="hidden" name="add_product_id" value="">
	<div class="form-group">
		<label for="qty">Qty</label>
		<input type="number" step="1" min="1" class="form-control" id="qty" name="qty" value="1">
	</div>
	<button type="submit" class="btn btn-success">
		Add to cart
	</button>
</form>
<!--- end of add to cart form --->
</cfoutput>
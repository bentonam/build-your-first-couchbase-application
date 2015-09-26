<cfoutput>
<h1>#variables.product.document.getTitle()#</h1>
<p>#variables.product.document.getShort_Description()#</p>
<!--- start of star ratings / reviews --->
<div class="ratings clearfix">
	<cfset variables['rating'] = variables.product.document.getAverageReviewRating()/>
	<div class="stars pull-left">
		<span class="glyphicon glyphicon-star<cfif variables.rating lte 1>-empty</cfif>"></span>
		<span class="glyphicon glyphicon-star<cfif variables.rating lte 2>-empty</cfif>"></span>
		<span class="glyphicon glyphicon-star<cfif variables.rating lte 3>-empty</cfif>"></span>
		<span class="glyphicon glyphicon-star<cfif variables.rating lte 4>-empty</cfif>"></span>
		<span class="glyphicon glyphicon-star<cfif variables.rating lte 5>-empty</cfif>"></span>
	</div>
	<div class="rating">
		#variables.product.document.getReviewTotal()# reviews
	</div>
</div>
<!--- end of star ratings / reviews --->
<hr />
<!--- start of price --->
<cfif variables.product.document.isOnSale()>
	<h3 class="price sale">#dollarFormat(variables.product.document.getSale_Price())# <strike>#dollarFormat(variables.product.document.getPrice())#</strike></h3>
<cfelse>
	<h3 class="price">#dollarFormat(variables.product.document.getPrice())#</h3>
</cfif>
<!--- end of price --->
<!--- start of availability --->
<cfset variables['availability'] = variables.product.document.getAvailability()/>
<cfif variables.availability eq "In-Stock">
	<h4 class="availability in-stock">In-Stock</h4>
<cfelseif variables.availability eq "Out of Stock">
	<h4 class="availability out-of-stock">Out of Stock</h4>
<cfelseif variables.availability eq "Discontinued">
	<h4 class="availability discontinued">Discontinued</h4>
<cfelseif variables.availability eq "Preorder">
	<h4 class="availability preorder">Pre-order</h4>
</cfif>
<!--- end of availability --->
<!--- start of add to cart form --->
<cfif variables.availability eq "In-Stock" or variables.availability eq "Preorder">
	<hr />
	<form class="form-inline" action="cart.cfm" method="post">
		<input type="hidden" name="add_product_id" value="#variables.product.document.getProduct_ID()#">
		<div class="form-group">
			<label for="qty">Qty</label>
			<input type="number" step="1" min="1" class="form-control" id="qty" name="qty" value="1">
		</div>
		<button type="submit" class="btn btn-success">
			Add to cart
		</button>
	</form>
</cfif>
<!--- end of add to cart form --->
</cfoutput>
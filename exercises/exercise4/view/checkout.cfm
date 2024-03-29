<cfoutput>
<form action="cart.cfm" method="post">
	<!--- start of breadcrumb --->
	<ol class="breadcrumb">
		<li><a href="index.cfm">Home</a></li>
		<li><a href="cart.cfm">Cart</a></li>
		<li class="active">Checkout</li>
	</ol>
	<!--- end of breadcrumb --->
	<!--- start of billing --->
	<cfinclude template="includes/checkout.billing.cfm"/>
	<!--- end of billing --->
	<!--- start of shipping --->
	<cfinclude template="includes/checkout.shipping.cfm"/>
	<!--- end of shipping --->
	<!--- start of payment details --->
	<cfinclude template="includes/checkout.payment.cfm"/>
	<!--- end of payment details --->
	<!--- start of order totals --->
	<cfinclude template="includes/checkout.totals.cfm"/>
	<!--- end of order totals --->
	<hr />
	<div class="row">
		<div class="col-xs-12 col-md-offset-9 col-md-3">
			<button class="btn btn-success btn-lg btn-block" type="submit" formaction="invoice.cfm">Place Order</button>
		</div>
	</div>
	<!--- output the cart document id for debugging purposes
	<p><b>Cart ID:</b> #variables.cart.document.getCart_ID()#</p> --->
</form>
</cfoutput>
<script>
$(document).ready(function(){
	var $billing = $("#billing"),
		$shipping = $("#shipping");
	$billing
		// add basic copying of fields
		.on("change", "input[name=same_as_billing]", function(event){
			var $same = $(this);
			if($same.prop("checked")){
				$shipping.hide();
				$billing
					.find("input:not(:checkbox)")
						.each(function(i, v){
							var $field = $(this);
							$("#" + $field.attr("id").replace("billing", "shipping")).val($field.val());
						})
			}
			else{
				$shipping.show();
			}
		})
		// resubmit on shipping change to calculate totals
		.on("change", "input[name=shipping_method]", function(event){
			$(this).parents("form").submit();
		});
});
</script>
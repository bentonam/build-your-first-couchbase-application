<!--- get a handler to the order service --->
<cfset variables['checkout_service'] = new com.example.CheckoutService()/>
<!--- get the incomplete order and pass it the form data for population --->
<cfset variables['order'] = variables.checkout_service.getIncompleteOrder(data=form)/>
<!--- get the states --->
<cfset variables['states'] = variables.checkout_service.getStates()/>
<!--- get the shipping methods --->
<cfset variables['shipping_methods'] = variables.checkout_service.getShippingMethods()/>
<cfoutput>
<form action="checkout.cfm" method="post">
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
		$shipping = $("#shipping"),
		$same = $("#same_as_billing");
	$same
		// add basic copying of fields
		.on("change", function(event){
			console.log("changed")
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
		.trigger("change");
		// resubmit on shipping change to calculate totals
	$("#shipping_code").on("change", function(event){
		$(this).parents("form").submit();
	});
});
</script>
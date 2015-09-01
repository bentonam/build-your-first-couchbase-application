<!--- get a handler to the order service --->
<cfset variables['checkout_service'] = new root.final.com.benton.CheckoutService()/>
<!--- get the incomplete order and pass it the form data for population --->
<cfset variables['order'] = variables.checkout_service.saveOrder(data=form)/>
<!--- get the line items in the cart --->
<cfset variables['line_items'] = variables.order.document.getLine_Items()/>
<cfoutput>
<!--- start of breadcrumb --->
<ol class="breadcrumb">
	<li><a href="index.cfm">Home</a></li>
	<li><a href="cart.cfm">Cart</a></li>
	<li class="active">Checkout</li>
	<li class="active">Invoice</li>
</ol>
<!--- end of breadcrumb --->
<p class="alert alert-success alert-dismissible" role="alert">
	<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	<i class="glyphicon glyphicon-thumbs-up"></i>
	Your order has been successfully submitted on #variables.order.document.getOrderDateFormatted()#
</p>
<!--- start of billing --->
<cfinclude template="/root/final/view/includes/invoice.details.cfm"/>
<!--- end of billing --->
<!--- start of payment details --->
<cfinclude template="/root/final/view/includes/invoice.items.cfm"/>
<!--- end of payment details --->
<!--- start of order totals --->
<cfinclude template="/root/final/view/includes/checkout.totals.cfm"/>
<!--- end of order totals --->
<!--- output the cart document id for debugging purposes --->
<p><b>Order Document ID:</b> order_#variables.order.document.getOrder_ID()#</p>
</cfoutput>
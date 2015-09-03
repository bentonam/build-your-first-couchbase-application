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
	Your order has been successfully submitted on #dateTimeFormat(now(), "mm/dd/yyy h:mm tt")#
</p>
<!--- start of billing --->
<cfinclude template="includes/invoice.details.cfm"/>
<!--- end of billing --->
<!--- start of payment details --->
<cfinclude template="includes/invoice.items.cfm"/>
<!--- end of payment details --->
<!--- start of order totals --->
<cfinclude template="includes/checkout.totals.cfm"/>
<!--- end of order totals --->
</cfoutput>
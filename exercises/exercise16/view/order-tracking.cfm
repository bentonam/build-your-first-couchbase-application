<!--- default form variables --->
<cfparam name="form.order_id" type="numeric" default="0"/>
<cfparam name="form.email_address" type="string" default=""/>
<cfparam name="form.postal_code" type="string" default=""/>
<cfoutput>
<!--- start of breadcrumb --->
<ol class="breadcrumb">
	<li><a href="index.cfm">Home</a></li>
	<li class="active">Order Tracking</li>
</ol>
<!--- end of breadcrumb --->
<div class="row">
	<div class="col-md-6">
		<form action="order-tracking.cfm" method="post">
			<fieldset>
				<legend>Order Tracking</legend>
				<div class="form-group">
					<label for="order_id">Order ID</label>
					<input type="number" step="1" min="1" class="form-control" id="order_id" name="order_id" required value="#form.order_id ? form.order_id : ''#" placeholder="Order ID">
				</div>
				<div class="form-group">
					<label for="email">Email</label>
					<input type="email" class="form-control" id="email_address" name="email_address" value="#form.email_address#" placeholder="john.smith@email.com">
				</div>
				<div class="form-group">
					<label for="exampleInputFile">Postal Code</label>
					<input type="number" step="1" min="11111" max="99999" class="form-control" id="postal_code" name="postal_code" required value="#len(form.postal_code) ? form.postal_code : ''#" placeholder="22222">
				</div>
				<button type="submit" class="btn btn-primary pull-right">Lookup Order</button>
			</fieldset>
		</form>
	</div>
</div>
<cfif isNumeric(form.order_id) && form.order_id>
	<hr />
	<!--- get a handle to the order tracking server service --->
	<cfset variables['tracking_service'] = new com.example.OrderTrackingService()/>
	<!--- look up the order --->
	<cfset variables['order'] = variables.tracking_service.getOrder(order_id=form.order_id, email_address=form.email_address, postal_code=form.postal_code)/>
	<!--- show details if a lookup was performed --->
	<cfif len(variables.order.getBilling_Email())>
		<!--- get the line items in the cart --->
		<cfset variables['line_items'] = variables.order.getLine_Items()/>
		<!--- start of billing --->
		<cfinclude template="includes/invoice.details.cfm"/>
		<!--- end of billing --->
		<!--- start of payment details --->
		<cfinclude template="includes/invoice.items.cfm"/>
		<!--- end of payment details --->
		<!--- start of order totals --->
		<cfinclude template="includes/checkout.totals.cfm"/>
		<!--- end of order totals --->
	<cfelse>
		<p class="alert alert-danger alert-dismissible" role="alert">
			<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
			<span class="sr-only">Error:</span>
			The order could not be found.
		</p>
	</cfif>
</cfif>
</cfoutput>

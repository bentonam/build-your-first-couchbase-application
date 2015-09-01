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
					<input type="number" step="1" min="1" class="form-control" id="order_id" name="order_id" required value="" placeholder="Order ID">
				</div>
				<div class="form-group">
					<label for="email">Email</label>
					<input type="email" class="form-control" id="email_address" name="email_address" value="" placeholder="john.smith@email.com">
				</div>
				<div class="form-group">
					<label for="exampleInputFile">Postal Code</label>
					<input type="number" step="1" min="11111" max="99999" class="form-control" id="postal_code" name="postal_code" required value="" placeholder="john.smith@email.com">
				</div>
				<button type="submit" class="btn btn-primary pull-right">Lookup Order</button>
			</fieldset>
		</form>
	</div>
</div>
<hr /><!--- start of billing --->
<cfinclude template="/root/exercise3_completed/view/includes/invoice.details.cfm"/>
<!--- end of billing --->
<!--- start of payment details --->
<cfinclude template="/root/exercise3_completed/view/includes/invoice.items.cfm"/>
<!--- end of payment details --->
<!--- start of order totals --->
<cfinclude template="/root/exercise3_completed/view/includes/checkout.totals.cfm"/>
<!--- end of order totals --->
</cfoutput>
<!--- default form payment variables since we aren't writing them on the order --->
<cfparam name="form.card_name" type="string" default=""/>
<cfparam name="form.card_number" type="string" default=""/>
<cfparam name="form.expiration_date" type="string" default=""/>
<cfparam name="form.cvv" type="string" default=""/>
<cfoutput>
<div id="payment" class="panel panel-primary">
	<div class="panel-heading">
		<h3 class="panel-title">Payment and Shipping Information</h3>
	</div>
	<div class="panel-body">
		<div class="row">
			<!--- start of payment details --->
			<div class="col-md-6">
				<div class="form-group">
					<label for="card_name">Name on Card</label>
					<input type="text" class="form-control" name="card_name" id="card_name" value="#form.card_name#" required placeholder="Name as it appears on Card">
				</div>
				<div class="form-group">
					<label for="card_number">Card Number</label>
					<input type="number" step="1" class="form-control" name="card_number" id="card_number" value="#form.card_number#" required placeholder="4111111111111111">
				</div>
				<div class="form-group">
					<label for="expiration_date">Expiration Date</label>
					<input class="form-control" type="month" id="expiration_date" name="expiration_date" value="#form.expiration_date#" required placeholder="">
				</div>
				<div class="form-group">
					<label for="cvv">Card CVV</label>
					<input type="number" step="1" class="form-control" name="cvv" id="cvv" required value="#form.cvv#" placeholder="Security Code">
				</div>
			</div>
			<!--- end of payment details --->
			<!--- start of shipping method --->
			<div class="col-md-6">
				<div class="form-group">
					<label for="shipping_code">Shipping Method</label>
					<select class="form-control" name="shipping_code" id="shipping_code" required>
						<cfloop collection="#variables.shipping_methods#" item="variables.method">
							<option value="#variables.shipping_methods[variables.method].code#" <cfif variables.shipping_methods[variables.method].code eq variables.order.getShipping_Code()> selected</cfif>>#variables.shipping_methods[variables.method].name# (#dollarFormat(variables.shipping_methods[variables.method].cost)#)</option>
						</cfloop>
					</select>
				</div>
			</div>
			<!--- end of shipping method --->
		</div>
	</div>
</div>
</cfoutput>
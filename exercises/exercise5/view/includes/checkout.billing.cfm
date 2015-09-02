<cfoutput>
<div id="billing" class="panel panel-primary">
	<div class="panel-heading">
		<h3 class="panel-title">Billing Details</h3>
	</div>
	<div class="panel-body">
		<div class="row">
			<div class="col-md-6">
				<div class="form-group">
					<label for="billing_name">Name</label>
					<input type="text" class="form-control" id="billing_name" name="billing_name" value="" required placeholder="John Smith">
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="billing_email">Email</label>
					<input type="text" class="form-control" id="billing_email" name="billing_email" value="" required placeholder="john.smith@email.com">
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="billing_address_1">Address 1</label>
					<input type="text" class="form-control" id="billing_address_1" name="billing_address_1" value="" required placeholder="123 Demo Rd.">
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="billing_address_2">Address 2</label>
					<input type="text" class="form-control" id="billing_address_2" name="billing_address_2" value="" placeholder="">
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="billing_city">City</label>
					<input type="text" class="form-control" id="billing_city" name="billing_city" value="" required placeholder="Raleigh">
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="billing_city">State</label>
					<select class="form-control" id="billing_state" name="billing_state" required>
						<option value="NC">North Carolina</option>
					</select>
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="postal_code">Postal Code</label>
					<input type="number" step="1" min="10000" max="99999" class="form-control" id="billing_postal_code" name="billing_postal_code" value="" required placeholder="22222">
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="billing_phone">Phone</label>
					<input type="tel" class="form-control" id="billing_phone" name="billing_phone" value="" required placeholder="111-111-1111">
				</div>
			</div>
			<div class="col-md-6">
				<div class="checkbox">
					<label>
						<input type="checkbox" name="same_as_billing" value="1">
						Shipping same as Billing?
					</label>
				</div>
			</div>
		</div>
	</div>
</div>
</cfoutput>
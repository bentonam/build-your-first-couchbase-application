<cfoutput>
<div id="shipping" class="panel panel-primary">
	<div class="panel-heading">
		<h3 class="panel-title">Shipping Details</h3>
	</div>
	<div class="panel-body">
		<div class="row">
			<div class="col-md-6">
				<div class="form-group">
					<label for="shipping_name">Name</label>
					<input type="text" class="form-control" id="shipping_name" name="shipping_name" value="" required placeholder="John Smith">
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="shipping_email">Email</label>
					<input type="text" class="form-control" id="shipping_email" name="shipping_email" value="" required placeholder="john.smith@email.com">
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="shipping_address_1">Address 1</label>
					<input type="text" class="form-control" id="shipping_address_1" name="shipping_address_1" value="" required placeholder="123 Demo Rd.">
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="shipping_address_2">Address 2</label>
					<input type="text" class="form-control" id="shipping_address_2" name="shipping_address_2" value="" placeholder="">
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="shipping_city">City</label>
					<input type="text" class="form-control" id="shipping_city" name="shipping_city" value="" required placeholder="Raleigh">
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="shipping_city">State</label>
					<select class="form-control" id="shipping_state" name="shipping_state" required>
						<option value="NC">North Carolina</option>
					</select>
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="postal_code">Postal Code</label>
					<input type="number" step="1" min="10000" max="99999" class="form-control" id="shipping_postal_code" name="shipping_postal_code" value="" required placeholder="22222">
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="shipping_phone">Phone</label>
					<input type="tel" class="form-control" id="shipping_phone" name="shipping_phone" value="" required placeholder="111-111-1111">
				</div>
			</div>
		</div>
	</div>
</div>
</cfoutput>
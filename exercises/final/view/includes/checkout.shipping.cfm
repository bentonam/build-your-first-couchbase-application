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
					<input type="text" class="form-control" id="shipping_name" name="shipping_name" value="#variables.order.document.getshipping_Name()#" required placeholder="John Smith">
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="shipping_email">Email</label>
					<input type="text" class="form-control" id="shipping_email" name="shipping_email" value="#variables.order.document.getshipping_Email()#" required placeholder="john.smith@email.com">
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="shipping_address_1">Address 1</label>
					<input type="text" class="form-control" id="shipping_address_1" name="shipping_address_1" value="#variables.order.document.getshipping_Address_1()#" required placeholder="123 Demo Rd.">
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="shipping_address_2">Address 2</label>
					<input type="text" class="form-control" id="shipping_address_2" name="shipping_address_2" value="#variables.order.document.getshipping_Address_2()#" placeholder="">
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="shipping_city">City</label>
					<input type="text" class="form-control" id="shipping_city" name="shipping_city" value="#variables.order.document.getshipping_City()#" required placeholder="Raleigh">
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="shipping_city">State</label>
					<select class="form-control" id="shipping_state" name="shipping_state" required>
						<cfloop array="#variables.states#" index="variables.state">
							<option value="#variables.state.code#"<cfif variables.order.document.getshipping_State() eq variables.state.code> selected</cfif>>#variables.state.name#</option>
						</cfloop>
					</select>
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="postal_code">Postal Code</label>
					<input type="number" step="1" min="10000" max="99999" class="form-control" id="shipping_postal_code" name="shipping_postal_code" value="#variables.order.document.getshipping_Postal_Code()#" required placeholder="22222">
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="shipping_phone">Phone</label>
					<input type="tel" class="form-control" id="shipping_phone" name="shipping_phone" value="#variables.order.document.getshipping_Phone()#" required placeholder="111-111-1111">
				</div>
			</div>
		</div>
	</div>
</div>
</cfoutput>
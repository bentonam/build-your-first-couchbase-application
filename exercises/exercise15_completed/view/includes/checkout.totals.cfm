<cfoutput>
<div class="row">
	<div class="col-md-4 col-md-offset-8 text-right">
		<h5>Sub-Total: #dollarFormat(variables.order.getSub_Total())#</h5>
		<h5>Shipping Total: #dollarFormat(variables.order.getShipping_Total())#</h5>
		<h5>Tax: #dollarFormat(variables.order.getTax())#</h5>
		<h4>Total: #dollarFormat(variables.order.getGrand_Total())#</h4>
	</div>
</div>
</cfoutput>
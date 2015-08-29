<cfoutput>
<div class="row">
	<div class="col-md-4 col-md-offset-8 text-right">
		<h5>Sub-Total: #dollarFormat(variables.order.document.getSub_Total())#</h5>
		<h5>Shipping Total: #dollarFormat(variables.order.document.getShipping_Total())#</h5>
		<h5>Tax: #dollarFormat(variables.order.document.getTax())#</h5>
		<h4>Total: #dollarFormat(variables.order.document.getGrand_Total())#</h4>
	</div>
</div>
</cfoutput>
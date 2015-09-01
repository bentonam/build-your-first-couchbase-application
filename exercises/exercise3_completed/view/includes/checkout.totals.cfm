<cfoutput>
<div class="row">
	<div class="col-md-4 col-md-offset-8 text-right">
		<h5>Sub-Total: #dollarFormat(randRange(500, 5000))#</h5>
		<h5>Shipping Total: #dollarFormat(randRange(5, 25))#</h5>
		<h5>Tax: #dollarFormat(randRange(10, 100))#</h5>
		<h4>Total: #dollarFormat(randRange(500, 5000))#</h4>
	</div>
</div>
</cfoutput>
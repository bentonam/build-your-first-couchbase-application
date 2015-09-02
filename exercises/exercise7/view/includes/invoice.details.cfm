<cfoutput>
<div class="row">
	<div class="col-md-6">
		<h4>Order ##: #randRange(500, 5000)#</h4>
	</div>
	<div class="col-md-6">
		<h4>Order Date: #dateTimeFormat(now(), "mm/dd/yyyy h:mm tt")#</h4>
	</div>
</div>
<div class="panel panel-primary">
	<div class="panel-heading">
		<h3 class="panel-title">Billing and Shipping Details</h3>
	</div>
	<div class="panel-body">
		<div class="row">
			<!--- start of billing --->
			<div class="col-md-6">
				<h4>Billing</h4>
				John Smith<br />
				<a href="mailto:##">john.smith@email.com</a><br />
				123 Broadway St.<br />
				Apt. A<br />
				Greensboro, NC 27409<br />
				<a href="tel:1111111111">111-111-1111</a>
			</div>
			<!--- end of billing --->
			<!--- start of shipping --->
			<div class="col-md-6">
				<h4>Shipping</h4>
				John Smith<br />
				<a href="mailto:##">john.smith@email.com</a><br />
				123 Broadway St.<br />
				Apt. A<br />
				Greensboro, NC 27409<br />
				<a href="tel:1111111111">111-111-1111</a>
			</div>
			<!--- end of sihpping --->
		</div>
	</div>
</div>
</cfoutput>
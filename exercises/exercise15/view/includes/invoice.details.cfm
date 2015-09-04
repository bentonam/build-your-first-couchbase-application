<cfoutput>
<div class="row">
	<div class="col-md-6">
		<h4>Order ##: #variables.order.getOrder_ID()#</h4>
	</div>
	<div class="col-md-6">
		<h4>Order Date: #variables.order.getOrderDateFormatted()#</h4>
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
				#variables.order.getBilling_Name()#<br />
				<a href="mailto:#variables.order.getBilling_Email()#">#variables.order.getBilling_Email()#</a><br />
				#variables.order.getBilling_Address_1()#<br />
				<cfif len(variables.order.getBilling_Address_2())>
					#variables.order.getBilling_Address_2()#<br />
				</cfif>
				#variables.order.getBilling_City()#, #variables.order.getBilling_State()# #variables.order.getBilling_Postal_Code()#<br />
				<a href="tel:#variables.order.getBilling_Phone()#">#variables.order.getBilling_Phone()#</a>
			</div>
			<!--- end of billing --->
			<!--- start of shipping --->
			<div class="col-md-6">
				<h4>Shipping</h4>
				#variables.order.getShipping_Name()#<br />
				<a href="mailto:#variables.order.getShipping_Email()#">#variables.order.getShipping_Email()#</a><br />
				#variables.order.getShipping_Address_1()#<br />
				<cfif len(variables.order.getShipping_Address_2())>
					#variables.order.getShipping_Address_2()#<br />
				</cfif>
				#variables.order.getShipping_City()#, #variables.order.getShipping_State()# #variables.order.getShipping_Postal_Code()#<br />
				<a href="tel:#variables.order.getShipping_Phone()#">#variables.order.getShipping_Phone()#</a>
			</div>
			<!--- end of sihpping --->
		</div>
	</div>
</div>
</cfoutput>
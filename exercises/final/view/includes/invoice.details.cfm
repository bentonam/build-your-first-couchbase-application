<cfoutput>
<div class="row">
	<div class="col-md-6">
		<h4>Order ##: #variables.order.document.getOrder_ID()#</h4>
	</div>
	<div class="col-md-6">
		<h4>Order Date: #variables.order.document.getOrderDateFormatted()#</h4>
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
				#variables.order.document.getBilling_Name()#<br />
				<a href="mailto:#variables.order.document.getBilling_Email()#">#variables.order.document.getBilling_Email()#</a><br />
				#variables.order.document.getBilling_Address_1()#<br />
				<cfif len(variables.order.document.getBilling_Address_2())>
					#variables.order.document.getBilling_Address_2()#<br />
				</cfif>
				#variables.order.document.getBilling_City()#, #variables.order.document.getBilling_State()# #variables.order.document.getBilling_Postal_Code()#<br />
				<a href="tel:#variables.order.document.getBilling_Phone()#">#variables.order.document.getBilling_Phone()#</a>
			</div>
			<!--- end of billing --->
			<!--- start of shipping --->
			<div class="col-md-6">
				<h4>Shipping</h4>
				#variables.order.document.getShipping_Name()#<br />
				<a href="mailto:#variables.order.document.getShipping_Email()#">#variables.order.document.getShipping_Email()#</a><br />
				#variables.order.document.getShipping_Address_1()#<br />
				<cfif len(variables.order.document.getShipping_Address_2())>
					#variables.order.document.getShipping_Address_2()#<br />
				</cfif>
				#variables.order.document.getShipping_City()#, #variables.order.document.getShipping_State()# #variables.order.document.getShipping_Postal_Code()#<br />
				<a href="tel:#variables.order.document.getShipping_Phone()#">#variables.order.document.getShipping_Phone()#</a>
			</div>
			<!--- end of sihpping --->
		</div>
	</div>
</div>
</cfoutput>
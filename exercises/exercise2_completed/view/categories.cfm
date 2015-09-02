<cfoutput>
<!--- start of product listing --->
<div class="product-listing">
	<!--- start of breadcrumb --->
	<ol class="breadcrumb">
		<li><a href="index.cfm">Home</a></li>
		<li class="active">Categories</li>
		<li><a href="categories.cfm">Category Name</a></li>
	</ol>
	<!--- end of breadcrumb --->
	<!--- end of breadcrumb --->
	<div class="row">
		<cfloop from="1" to="24" index="variables.i">
			<cfinclude template="/root/exercise2_completed/view/includes/template.product.cfm"/>
		</cfloop>
	</div>
</div>
<!--- end of product listing --->
<!--- start of pagination --->
<ul class="pagination">
	<li><a href="##">«</a></li>
	<li class="active"><a>1 <span class="sr-only">(current)</span></a></li>
	<cfloop from="2" to="10" index="variables.i">
		<li><a href="##">#variables.i#</a></li>
	</cfloop>
	<li><a href="##">»</a></li>
</ul>
<!--- end of pagination --->
</cfoutput>
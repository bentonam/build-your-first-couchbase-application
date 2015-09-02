<cfoutput>
<div class="product-detail">
	<!--- start of breadcrumb --->
	<ol class="breadcrumb">
		<li><a href="index.cfm">Home</a></li>
		<li><a href="categories.cfm">Category Name</a></li>
		<li><a href="product.cfm">Lorem ipsum dolor sit amet</a></li>
		<li class="active">Reviews</li>
	</ol>
	<!--- end of breadcrumb --->
	<div class="row">
		<!--- start of images --->
		<div class="col-sm-12 col-md-5">
			<cfinclude template="/root/exercise6_completed/view/includes/product.images.cfm"/>
		</div>
		<!--- end of images --->
		<!--- start of info --->
		<div class="col-sm-12 col-md-7">
			<cfinclude template="/root/exercise6_completed/view/includes/product.info.cfm"/>
		</div>
		<!--- end of info --->
	</div>
	<!--- start of tabs --->
	<div class="row">
		<div class="col-md-12">
				<cfinclude template="/root/exercise6_completed/view/includes/product.tabs.reviews.cfm"/>
		</div>
	</div>
	<!--- end of tabs --->
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
</div>
</cfoutput>
<cfoutput>
<div class="product-detail">
	<!--- start of breadcrumb --->
	<ol class="breadcrumb">
		<li><a href="index.cfm">Home</a></li>
		<li><a href="categories.cfm">Category Name</a></li>
		<li class="active">Lorem ipsum dolor sit amet</li>
	</ol>
	<!--- end of breadcrumb --->
	<div class="row">
		<!--- start of images --->
		<div class="col-sm-12 col-md-5">
			<cfinclude template="/root/exercise2/view/includes/product.images.cfm"/>
		</div>
		<!--- end of images --->
		<!--- start of info --->
		<div class="col-sm-12 col-md-7">
			<cfinclude template="/root/exercise2/view/includes/product.info.cfm"/>
		</div>
		<!--- end of info --->
	</div>
	<!--- start of tabs --->
	<div class="row">
		<div class="col-md-12">
			<cfinclude template="/root/exercise2/view/includes/product.tabs.cfm"/>
		</div>
	</div>
	<!--- end of tabs --->
</div>
</cfoutput>
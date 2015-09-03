<!--- get a handle to the category service --->
<cfset variables['category_service'] = new root.exercise4_completed.com.example.CategoryService()/>
<!--- get the categories --->
<cfset variables['site_categories'] = variables.category_service.getCategories()/>
<!--- get a handle to the brand service --->
<cfset variables['brand_service'] = new root.exercise4_completed.com.example.BrandService()/>
<!--- get the site brands --->
<cfset variables['site_brands'] = variables.brand_service.getBrands()/>
<cfoutput>
<header>
<nav class="navbar navbar-inverse navbar-static-top" role="navigation">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="##bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.cfm">#variables.site_config.site_name#</a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<!--- start of main nav --->
			<ul class="nav navbar-nav">
				<li class="dropdown">
					<a href="##" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Categories <span class="caret"></span>
					<ul class="dropdown-menu">
						<cfloop array="#variables.site_categories#" index="variables.category">
							<li><a href="categories.cfm?category=#urlEncodedFormat(variables.category.name)#">#variables.category.name#</a></li>
						</cfloop>
					</ul>
				</li>
				<li>
					<a href="##" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Brands <span class="caret"></span>
					<ul class="dropdown-menu">
						<cfloop array="#variables.site_brands#" index="variables.brand">
							<li><a href="brands.cfm?brand=#urlEncodedFormat(variables.brand.name)#">#variables.brand.name#</a></li>
						</cfloop>
					</ul>
				</li>
				<li>
					<a href="order-tracking.cfm">Order Tracking</a>
				</li>
			</ul>
			<!--- end of main nav --->
			<!--- start of search / cart nav --->
			<ul class="nav navbar-nav navbar-right">
				<li>
					<form class="navbar-form" role="search" action="search.cfm" method="get">
						<div class="input-group">
							<input type="text" class="form-control" placeholder="Search" name="keyword">
							<div class="input-group-btn">
								<button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
							</div>
						</div>
					</form>
				</li>
				<li class="dropdown">
					<cfinclude template="layout.header.cart.cfm"/>
				</li>
			</ul>
			<!--- start of search / cart nav --->
		</div>
	</div>
</nav>
</header>
</cfoutput>
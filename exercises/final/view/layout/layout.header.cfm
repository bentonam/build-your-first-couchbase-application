<cfset variables['categories'] = new root.org.benton.site.Categories()/>
<cfset variables['site_categories'] = categories.getSiteCategories()/>
<cfset variables['brands'] = new root.org.benton.site.Brands()/>
<cfset variables['site_brands'] = brands.getSiteBrands()/>
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
			<a class="navbar-brand" href="index.cfm">Company Name</a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<!--- start of main nav --->
			<ul class="nav navbar-nav">
				<li class="dropdown">
					<a href="##" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Categories <span class="caret"></span>
					<ul class="dropdown-menu">
						<cfloop from="1" to="#variables.site_categories.count#" index="i">
							<li><a href="categories.cfm?category=#urlEncodedFormat(variables.site_categories.results[i].key)#">#variables.site_categories.results[i].key#</a></li>
						</cfloop>
					</ul>
				</li>
				<li>
					<a href="##" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Brands <span class="caret"></span>
					<ul class="dropdown-menu">
						<cfloop from="1" to="#variables.site_brands.count#" index="i">
							<li>
								<a href="brands.cfm?brand=#urlEncodedFormat(variables.site_brands.results[i].key)#">#variables.site_brands.results[i].key#</a>
							</li>
						</cfloop>
					</ul>
				</li>
				<li>
					<a href="##">Contact</a>
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
					<a href="##" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"> <span class="glyphicon glyphicon-shopping-cart"></span> 7 - Items<span class="caret"></span></a>
					<ul class="dropdown-menu dropdown-cart" role="menu">
						<li>
							<a href="##" class="row">
								<div class="col-md-3">
									<div class="thumbnail">
										<img src="http://lorempixel.com/50/50/" class="img-responsive"/>
									</div>
								</div>
								<div class="col-md-9">
									<h5>Item name lakjsdlk sjdlkj sldkj</h5>
									<h6 class="price">$55.99</h6>
								</div>
							</a>
						</li>
						<li>
							<a href="##" class="row">
								<div class="col-md-3">
									<div class="thumbnail">
										<img src="http://lorempixel.com/50/50/" class="img-responsive"/>
									</div>
								</div>
								<div class="col-md-9">
									<h5>Item name lakjsdlk sjdlkj sldkj</h5>
									<h6 class="price">$55.99</h6>
								</div>
							</a>
						</li>
						<li>
							<a href="##" class="row">
								<div class="col-md-3">
									<div class="thumbnail">
										<img src="http://lorempixel.com/50/50/" class="img-responsive"/>
									</div>
								</div>
								<div class="col-md-9">
									<h5>Item name lakjsdlk sjdlkj sldkj</h5>
									<h6 class="price">$55.99</h6>
								</div>
							</a>
						</li>
						<li>
							<a href="##" class="row">
								<div class="col-md-3">
									<div class="thumbnail">
										<img src="http://lorempixel.com/50/50/" class="img-responsive"/>
									</div>
								</div>
								<div class="col-md-9">
									<h5>Item name lakjsdlk sjdlkj sldkj</h5>
									<h6 class="price">$55.99</h6>
								</div>
							</a>
						</li>
						<li class="divider"></li>
						<li>
							<div>
								<a class="btn btn-primary btn-block btn-lg" href="cart.cfm">View Cart</a>
							</div>
						</li>
					</ul>
				</li>
			</ul>
			<!--- start of search / cart nav --->
		</div>
	</div>
</nav>
</header>
</cfoutput>
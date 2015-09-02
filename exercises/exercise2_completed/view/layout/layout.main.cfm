<!--- get a handle to the cart service --->
<cfset variables['site_service'] = new root.exercise2_completed.com.example.SiteService()/>
<!--- get the config --->
<cfset variables['site_config'] = variables.site_service.getSiteConfig()/>
<cfoutput>
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>#variables.site_config.seo_title#</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="/assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="/assets/css/site.css">
	<script src="/assets/js/jquery-1.11.3.min.js"></script>
	<script src="/assets/js/bootstrap.min.js"></script>
	<!--[if lt IE 9]>
	<script src="/assets/js/html5shiv.js"></script>
	<script src="/assets/js/respond.min.js"></script>
	<![endif]-->
</head>
<body>
<cfinclude template="/root/exercise2_completed/view/layout/layout.header.cfm"/>
<div class="container">
	<div class="row">
		<div id="sidebar" class="col-md-3 hidden-xs hidden-sm">
			<cfinclude template="/root/exercise2_completed/view/layout/layout.sidebar.cfm"/>
		</div>
		<div class="col-xs-12 col-md-9">
			<cfinclude template="#view#"/>
		</div>
	</div>
</div>
<cfinclude template="/root/exercise2_completed/view/layout/layout.footer.cfm"/>
</body>
</html>
</cfoutput>
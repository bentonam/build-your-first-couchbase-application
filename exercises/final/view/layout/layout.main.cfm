<cfoutput>
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title></title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/css/site.css">
	<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	<![endif]-->
</head>
<body>
<cfinclude template="layout.header.cfm"/>
<div class="container">
	<div class="row">
		<div class="col-md-3 hidden-xs">
			<cfinclude template="layout.sidebar.cfm"/>
		</div>
		<div class="col-xs-12 col-md-9">
			<cfinclude template="#view#"/>
		</div>
	</div>
</div>
<cfinclude template="layout.footer.cfm"/>
</body>
</html>
</cfoutput>
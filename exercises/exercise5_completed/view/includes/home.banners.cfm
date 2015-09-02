<!--- get the homepage banners --->
<cfset variables['banners'] = variables.site_service.getHomepageBanners()/>
<cfoutput>
<!--- only show banners if there is any --->
<cfif arrayLen(variables.banners)>
	<div class="row carousel-holder">
		<div class="col-md-12">
			<div id="carousel" class="carousel slide" data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="##carousel" data-slide-to="0" class="active"></li>
					<li data-target="##carousel" data-slide-to="1"></li>
					<li data-target="##carousel" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner">
					<cfset variables['counter'] = 1/>
					<cfloop array="#variables.banners#" index="variables.banner">
						<div class="item #variables.counter eq 1 ? 'active': ''#">
							<a href="#variables.banner.url#"><img class="slide-image" src="#variables.banner.image#" alt="#variables.banner.name#"></a>
						</div>
						<cfset variables.counter += 1/>
					</cfloop>
				</div>
				<a class="left carousel-control" href="##carousel" data-slide="prev">
					<span class="glyphicon glyphicon-chevron-left"></span>
				</a>
				<a class="right carousel-control" href="##carousel" data-slide="next">
					<span class="glyphicon glyphicon-chevron-right"></span>
				</a>
			</div>
		</div>
	</div>
</cfif>
</cfoutput>
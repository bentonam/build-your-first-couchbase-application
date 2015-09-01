<cfoutput>
<div class="thumbnail">
	<img src="http://placehold.it/400" class="img-responsive">
	<hr />
	<div class="row hidden-xs">
		<div class="col-xs-6 col-md-3">
			<div class="thumbnail">
				<img src="http://placehold.it/100" class="img-responsive">
			</div>
		</div>
		<cfloop from="1" to="3" index="variables.i">
			<div class="col-xs-6 col-md-3">
				<div class="thumbnail">
					<img src="http://placehold.it/100" class="img-responsive"/>
				</div>
			</div>
		</cfloop>
	</div>
</div>
</cfoutput>
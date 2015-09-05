<cfoutput>
<div class="thumbnail">
	<img src="#variables.product.document.getImage()#" class="img-responsive">
	<hr />
	<div class="row hidden-xs">
		<div class="col-xs-6 col-md-3">
			<div class="thumbnail">
				<img src="#variables.product.document.getImage()#" class="img-responsive">
			</div>
		</div>
		<cfloop array="#variables.product.document.getAlternate_Images()#" index="variables.image">
			<div class="col-xs-6 col-md-3">
				<div class="thumbnail">
					<img src="#variables.image#" class="img-responsive"/>
				</div>
			</div>
		</cfloop>
	</div>
</div>
</cfoutput>
<cfoutput>
<div class="row carousel-holder">
	<div class="col-md-12">
		<div id="carousel" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="##carousel" data-slide-to="0" class="active"></li>
				<li data-target="##carousel" data-slide-to="1"></li>
				<li data-target="##carousel" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="item active">
					<img class="slide-image" src="http://placehold.it/800x300" alt="">
				</div>
				<div class="item">
					<img class="slide-image" src="http://placehold.it/800x300" alt="">
				</div>
				<div class="item">
					<img class="slide-image" src="http://placehold.it/800x300" alt="">
				</div>
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
</cfoutput>
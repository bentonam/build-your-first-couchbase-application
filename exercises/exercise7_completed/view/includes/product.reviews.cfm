<cfoutput>
<div class="row">
	<!--- start of reviews --->
	<div class="col-md-8">
		<cfloop from="1" to="#randRange(2, 5)#" index="variables.i">
			<div class="review">
				<h4>Preexhibitor Gastroenterologic Siple Gunrunning Moesia</h4>
				<div class="row">
					<div class="col-md-5">
						<b>Yvonne Hughes</b>
						<time class="text-muted"><em>07/19/15</em></time>
					</div>
					<div class="col-md-7">
						<div class="ratings clearfix">
							<div class="stars pull-right">
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star-empty"></span>
								<span class="glyphicon glyphicon-star-empty"></span>
								<span class="glyphicon glyphicon-star-empty"></span>
							</div>
						</div>
					</div>
				</div>
				<p>Suspendisse facilisis et erat vel pharetra. Ut volutpat ornare interdum. Fusce et massa fringilla velit interdum pellentesque. Ut vitae urna eu nunc molestie tristique. Vivamus varius rhoncus placerat. Proin rutrum enim malesuada euismod luctus. Fusce at consectetur sem, et commodo lorem. Morbi efficitur non neque eu rutrum. Nullam urna elit, rhoncus a neque a, posuere pharetra dui. Suspendisse eu justo et nulla faucibus rutrum. Fusce a nunc mi. Phasellus auctor consectetur purus sit amet laoreet. Nulla vehicula malesuada fringilla. Praesent id sapien dui. Aliquam sapien justo, imperdiet in cursus vitae, tincidunt vitae massa. Phasellus vestibulum volutpat mi, sit amet tincidunt diam luctus ac.</p><p>Quisque id tellus tempus, bibendum ante in, varius est. Fusce vel mi nibh. Nullam vitae justo nulla. Nullam non rhoncus urna, sed sagittis lacus. Nunc congue massa massa. Nullam nec lobortis nisi. Suspendisse quis porttitor dolor, sit amet semper arcu. Morbi fringilla, ex vel commodo porta, metus nibh sodales enim, gravida ornare ex purus quis purus.</p><p>Etiam maximus pharetra dictum. Etiam auctor lectus eu pharetra condimentum. In gravida imperdiet nulla, at rhoncus est vehicula id. Ut vel pulvinar ex. Vivamus metus massa, finibus eget elementum quis, consequat iaculis ligula. Sed viverra scelerisque risus sed vulputate. Nunc purus metus, egestas id hendrerit vitae, vestibulum sit amet lorem. In vitae risus nisi. Ut nulla risus, volutpat lacinia neque condimentum, dignissim tincidunt risus. Sed dictum justo at bibendum scelerisque. Cras volutpat enim non metus cursus, in commodo est vulputate. Mauris nunc odio, dictum blandit velit nec, gravida mattis metus. Vestibulum malesuada sem ac massa bibendum aliquet.</p>
			</div>
		</cfloop>
	</div>
	<!--- end of reviews --->
	<!--- start of overall ratings --->
	<div class="col-md-4">
		<p class="lead">Overall Rating (#randRange(1, 25)# reviews)</p>
		<ul class="list-group">
			<li class="list-group-item">
				<span class="stars">
					<span class="glyphicon glyphicon-star"></span>
					<span class="glyphicon glyphicon-star"></span>
					<span class="glyphicon glyphicon-star"></span>
					<span class="glyphicon glyphicon-star"></span>
					<span class="glyphicon glyphicon-star"></span>
				</span>
				<span class="badge">#randRange(1, 25)#</span>
			</li>
			<li class="list-group-item">
				<span class="stars">
					<span class="glyphicon glyphicon-star"></span>
					<span class="glyphicon glyphicon-star"></span>
					<span class="glyphicon glyphicon-star"></span>
					<span class="glyphicon glyphicon-star"></span>
					<span class="glyphicon glyphicon-star-empty"></span>
				</span>
				<span class="badge">#randRange(1, 25)#</span>
			</li>
			<li class="list-group-item">
				<span class="stars">
					<span class="glyphicon glyphicon-star"></span>
					<span class="glyphicon glyphicon-star"></span>
					<span class="glyphicon glyphicon-star"></span>
					<span class="glyphicon glyphicon-star-empty"></span>
					<span class="glyphicon glyphicon-star-empty"></span>
				</span>
				<span class="badge">#randRange(1, 25)#</span>
			</li>
			<li class="list-group-item">
				<span class="stars">
					<span class="glyphicon glyphicon-star"></span>
					<span class="glyphicon glyphicon-star"></span>
					<span class="glyphicon glyphicon-star-empty"></span>
					<span class="glyphicon glyphicon-star-empty"></span>
					<span class="glyphicon glyphicon-star-empty"></span>
				</span>
				<span class="badge">#randRange(1, 25)#</span>
			</li>
			<li class="list-group-item">
				<span class="stars">
					<span class="glyphicon glyphicon-star"></span>
					<span class="glyphicon glyphicon-star-empty"></span>
					<span class="glyphicon glyphicon-star-empty"></span>
					<span class="glyphicon glyphicon-star-empty"></span>
					<span class="glyphicon glyphicon-star-empty"></span>
				</span>
				<span class="badge">#randRange(1, 25)#</span>
			</li>
		</ul>
	</div>
	<!--- end of overall ratings --->
</div>
</cfoutput>
<!--- default form values --->
<cfparam name="url.document_id" type="string" default=""/>
<cfparam name="form.document_id" type="string" default=""/>
<cfparam name="form.document_content" type="string" default=""/>
<!--- try to set the document --->
<cfif len(form.document_content) and isJSON(form.document_content)>
	<cfset application.couchbase.set(id=form.document_id, value=deserializeJSON(form.document_content))/>
</cfif>
<cfoutput>
<h1 class="lead">Couchbase Console</h1>
<hr />
<!--- if there is a document try to get it --->
<cfif len(url.document_id)>
	<!--- get the document --->
	<cfset variables['document'] = application.couchbase.get(id=url.document_id)/>
	<cfif !isNull(variables.document)>
		<cfset form['document_content'] = serializeJSON(document)/>
	<cfelse>
		<p class="alert alert-danger alert-dismissible" role="alert">
			<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			<i class="glyphicon glyphicon-warning-sign"></i>
			The document could not be found
		</p>
	</cfif>
</cfif>
<form action="console.cfm?document_id=#len(url.document_id) ? url.document_id : form.document_id#" method="post">
	<div class="form-group">
		<label for="document_id">Document ID</label>
		<input type="text" class="form-control" id="document_id" name="document_id" value="#url.document_id#" rqeuired placeholder="Document ID">
	</div>
	<button type="submit" class="btn btn-primary" id="lookup" formmethod="get">Lookup</button>
	<br />
	<br />
	<div class="form-group">
		<label for="exampleInputPassword1">Document Content <span id="valid"></span></label>
		<textarea class="form-control" id="document_content" name="document_content" rows="25">#form.document_content#</textarea>
	</div>
	<button type="submit" id="upsert" class="btn btn-primary">Upsert</button>
</form>
<cfif structKeyExists(variables, "document")>
	<br />
	<cfdump var="#variables.document#" label="Couchbase Document">
</cfif>
</cfoutput>
<script>
	$(document).ready(function(){
		var $document_id = $("#document_id"),
			$content = $("#document_content"),
			$upsert = $("#upsert");
			$valid = $("#valid");
		// pretty print the document content json
		$content
			.on("change keyup", function(event){
				try{
					$content.val(JSON.stringify(JSON.parse($content.val()), null, 4));
					$valid
						.removeClass("text-danger")
						.addClass("text-success")
						.text("Valid JSON");
					$upsert.prop("disabled", false);
				}
				catch(e){
					// don't allow the form to be submitted if the content is invalid json
					$upsert.prop("disabled", true);
					$valid
						.removeClass("text-success")
						.addClass("text-danger")
						.text($content.val() ? "Invalid JSON" : "");
				}
			})
			.trigger("change");
		// make sure keys are lowercased, with only letters numbers dashes, underscores and colons
		$document_id.on("change keyup", function(event){
			$document_id.val($document_id.val().toLowerCase().replace(/[^a-z0-9-_:]+/g, ""));
		});
		// blank out the document on get's to keep it out of the url string
		$("#lookup").on("click", function(event){
			$content.val("");
		})

	});
</script>
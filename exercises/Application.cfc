component{
	this.name = hash(getCurrentTemplatePath());
	this.applicationTimeout = createTimeSpan(0, 1, 0, 0);
	this.clientManagement = false;
	this.clientStorage = "";
	this.customTagPaths = "";
	this.datasource = "";
	this.loginStorage = "cookie";
	this.mappings = {};
	this.sessionManagement = true;
	this.sessionTimeout = createTimeSpan(0, 0, 30, 0);
	this.setClientCookies = false;
	this.setDomainCookies = false;
	this.scriptProtect = false;
	this.secureJSON = false;
	this.secureJSONPrefix = "";
	this.welcomeFileList = "";
	this.smtpServersettings = {};
	this.timeout = 30;
	this.enablerobustexception = true;
	this.ormenabled = false;
	this.ormsettings = {};
	// mappings
	this.mappings['/root'] = getDirectoryFromPath( getCurrentTemplatePath() );
	this.mappings['/cfcouchbase'] = this.mappings['/root'] & "com/ortus/cfcouchbase";

	/**
	* Runs when the application ends
	* @appScope the application scope
	*/
	public void function onApplicationEnd(required struct appScope){
// start of exercise 1.c --------------------------------------------------------------------
		// if the couchbase connection is present close it's connections
		if(structKeyExists(arguments.appScope, "couchbase")){
			application.couchbase.shutdown(10);
		}
		return;
// end of exercise 1.c ----------------------------------------------------------------------
		return;
	}

	/**
	* Runs at the start of a request
	* @page Path from the web root to the requested page
	*/
	public boolean function onRequestStart(required string page){
// start of exercise 1.b --------------------------------------------------------------------
		// create a connection to the default bucket if it does not already exist
		if(!structKeyExists(application, "couchbase")){
			application['couchbase'] = new cfcouchbase.CouchbaseClient({
				'servers' = ["http://127.0.0.1:8091"],
				'bucketName' = "default"
			});
		}
// end of exercise 1.b ----------------------------------------------------------------------
		return true;
	}

	/**
	* Runs when a request starts, after the onRequestStart event handler.
	* @page Path from the web root to the requested page
	*/
	public void function onRequest(required string page){
		var view = reReplace(arguments.page, "^(\\|/)([^\/]+)(\\|/)", "\1\2\3view\3");
		var layout = reReplace(view, "^(\\|/)([^\/]+)(\\|/).+$", "\1\2\3view\1layout\1layout.main.cfm");
		var com = reReplace(view, "^(\\|/)([^\/]+)(\\|/).+$", "\1\2\3com");
		// set a normalized mapping reference for the com directory in each exercise
		this.mappings['/com'] = this.mappings['/root'] & com;
		cfinclude(template=layout);
		return;
	}

	/**
	* Runs when there is an error
	* @exception The exception that occurred
	* @event_name The name of the error event
	*/
	public void function onError(struct exception, string event_name) {
		dump(var=arguments.exception, label=arguments.event_name);
	}
}
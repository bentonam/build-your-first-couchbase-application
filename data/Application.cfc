component{
	this.name = hash(getCurrentTemplatePath()) & 1;
	this.applicationTimeout = createTimeSpan(0, 0, 15, 0);
	this.clientManagement = false;
	this.clientStorage = "";
	this.customTagPaths = "";
	this.datasource = "";
	this.loginStorage = "cookie";
	this.mappings = {};
	this.sessionManagement = false;
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
	this.mappings['/cfcouchbase'] = this.mappings['/root'] & "org/ortus/cfcouchbase";
	/**
	* Runs when the application ends
	* @appScope the application scope
	*/
	public void function onApplicationEnd(required struct appScope){
		// if the couchbase connection is present close it's connections
		if(structKeyExists(arguments.appScope, "couchbase")){
			application.couchbase.shutdown(10);
		}
		return;
	}
	/**
	* Runs at the start of a request
	* @page Path from the web root to the requested page
	*/
	public boolean function onRequestStart(required string page){
		// couchbase default bucket
		if(!structKeyExists(application, "couchbase")){
			application['couchbase'] = new cfcouchbase.CouchbaseClient({
				'servers' = ["http://127.0.0.1:8091"],
				'bucketName' = "default"
			});
		}
		return true;
	}
	/**
	* Runs when a request starts, after the onRequestStart event handler.
	* @page Path from the web root to the requested page
	*/
	public void function onRequest(required string page){
		include arguments.page;
		return;
	}
	/**
	* Runs when there is an error
	* @exception The exception that occurred
	* @event_name The name of the error event
	*/
	public void function onError(struct exception, string event_name) {
		dump(var=exception,label=event_name);
	}
}
component{
	this.name = hash(getCurrentTemplatePath())  & 1;
	this.applicationTimeout = createTimeSpan(0, 0, 15, 0);
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
	this.mappings['/cfcouchbase'] = this.mappings['/root'] & "org/ortus/cfcouchbase";
	/**
	* Runs when a request starts, after the onRequestStart event handler.
	* @page Path from the web root to the requested page
	*/
	public boolean function onRequestStart(required string page){
		loadHandlers();
		return true;
	}
	/**
	* Runs when a request starts, after the onRequestStart event handler.
	* @page Path from the web root to the requested page
	*/
	public void function onRequest(required string page){
		var view = reReplace(arguments.page, "^(\\|/)([^\/]+)(\\|/)", "\1\2\3view\3");
		cfinclude(template="/root/view/layout/layout.main.cfm");
		return;
	}
	/**
	* Runs when a request starts, after the onRequestStart event handler.
	* @page Path from the web root to the requested page
	*/
	public void function onApplicationEnd(required struct appScope){
		// if the couchbase handler is present close it's connections
		if(structKeyExists(application, "couchbase")){
			application.couchbase.shutdown( 10 );
		}
		return;
	}
	public void function onError(struct exception, string eventName) {
		dump(var:exception,label:eventName);
	}
	private void function loadHandlers(){
		// utils
		if(!structKeyExists(application, "utils") || structKeyExists(url, "reload")){
			application['utils'] = new org.benton.Utils();
		}
		// couchbase default bucket
		if(!structKeyExists(application, "couchbase")){
			application['couchbase'] = new cfcouchbase.CouchbaseClient({
				'servers' = ["http://127.0.0.1:8091"],
				'bucketName' = "default"
			});
		}
		else if(structKeyExists(application, "couchbase") && structKeyExists(url, "reload")){
			// close any open connections
			application.couchbase.shutdown( 10 );
			application['couchbase'] = new cfcouchbase.CouchbaseClient({
				'servers' = ["http://127.0.0.1:8091"],
				'bucketName' = "default"
			});
		}
	}
}
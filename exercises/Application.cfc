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

// end of exercise 1.c ----------------------------------------------------------------------
		return;
	}

	/**
	* Runs at the start of a request
	* @page Path from the web root to the requested page
	*/
	public boolean function onRequestStart(required string page){
// start of exercise 1.b --------------------------------------------------------------------

// end of exercise 1.b ----------------------------------------------------------------------
		return true;
	}

	/**
	* Runs when a request starts, after the onRequestStart event handler.
	* @page Path from the web root to the requested page
	*/
	public void function onRequest(required string page){
		var view = reReplace(arguments.page, "^(.+exercise[0-9]+)(\\|\/)(view\/)?(.+)$", "\1\2view\2\4");
		var layout = reReplace(view, "^(.+exercise[0-9]+)(\\|\/).+$", "\1\2view\2layout\2layout.main.cfm");
		var com = reReplace(view, "^.+(exercise[0-9]+)(\\|\/).+$", "\1\2com");
		// set a normalized mapping reference for the com directory in each exercise
		this.mappings['/com'] = this.mappings['/root'] & com;
		// if it is the exercises listing page just show it without a layout
		if(reFind("^\/?index\.cfm|exercises\/index\.cfm", arguments.page)){
			cfinclude(template=arguments.page);
		}
		else{
			cfinclude(template=layout);
		}
		return;
	}

	/**
	* Runs when a template is not found (required for ACF but not Lucee)
	* @page Path from the web root to the requested page
	*/
	public boolean function onMissingTemplate(required string page){
		var view = reReplace(arguments.page, "^(.+exercise[0-9]+)(\\|\/)(.+)$", "\1\2view\2\3");
		onRequest(view);
		return true;
	}

	/**
	* Runs when there is an error
	* @exception The exception that occurred
	* @event_name The name of the error event
	*/
	public void function onError() {
		writeDump(arguments);
	}
}
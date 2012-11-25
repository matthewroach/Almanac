<cfsilent>
<cfscript>

	pages 						= new api.private.pages();

	_settings 				= application.settings;
  requestString   	= cgi.QUERY_STRING;
  requestData				= listToArray( cgi.QUERY_STRING, '/' );


	if ( requestString != '' ) {

		firstQString 		= requestData[1];
		if ( arrayLen( requestData ) == 2 ) {
			requestAction 	= requestData[2];
		}

		if ( _settings.url == firstQString && arrayLen( requestData ) >= 2 ) {

			page = pages.view( requestAction );

		} else {

			page.template 	= _settings.templates._404;

		}

	} else {

		page 							= pages.home();

	}

</cfscript>
</cfsilent>

	<cfinclude template = "#page.template#" />
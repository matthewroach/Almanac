component {

  this.name                     = "Almanac";

  // Session
  this.sessionmanagement        = true;
  this.sessiontimeout           = CreateTimeSpan( 0,2,0,0 );

  function onApplicationStart() {

    staticSettings              = fileRead( expandPath('/settings.json') );

    application.m               = CreateObject( "java" , "com.petebevin.markdown.MarkdownProcessor" );
    application.settings        = deserializeJSON( staticSettings );
    application.pages           = new api.private.pages();

  }

  function onRequestStart() {

    if ( !structKeyExists( application, 'settings' ) ) {

      staticSettings            = fileRead( expandPath('/settings.json') );
      application.settings      = deserializeJSON( staticSettings );

    }

    if ( !structKeyExists( application, 'pages') ) {

      application.pages         = new api.private.pages();

    }

  }

  function onError() {

    location( '?/404' );

  }

}

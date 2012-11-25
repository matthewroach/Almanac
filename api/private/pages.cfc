component {

	function home( ) {

		items = getHome( application.settings.homeCount );

		page = {
			template 	: application.settings.templates.home,
			content 	: items
		};

		return page;

	}

	function view( page ) {

		item = getFile( arguments.page );

		page = {
			template 	: application.settings.templates.view,
			title 		: item.meta.title,
			body 			: application.m.markdown( item.body ),
			meta 			: item.meta
		};

		return page;

	}


	function getFile( page ) {

		pages = DirectoryList( expandPath( application.settings.pageFolder ), false, 'query', '', 'desc' );

		for ( x = 1; x <= pages.recordCount; x++ ) {

			fileMatch = Find( arguments.page, pages.name[x] );

			if ( fileMatch >= 1 ) {

				file = pages.name[x];
				break;

			}

		}

		itemJSON  		= fileRead( expandPath( '/#application.settings.pageFolder#/#file#' ) );
		item 					= deserializeJSON( itemJSON );

		return item;

	}

	function getHome( count ) {

		pages 	= DirectoryList( expandPath( application.settings.pageFolder ), false, 'query', '', 'desc' );
		content = {};

		if ( count > pages.recordCount ) {
			count = pages.recordCount;
		}

		for ( x = 1; x <= count; x++ ) {

			itemJSON  		= fileRead( expandPath( '/#application.settings.pageFolder#/#pages.name[x]#' ) );
			item 					= deserializeJSON( itemJSON );

			pageNameLen 	= len( pages.name[x] );
			p 						= '';
			pageUrl 			= right( lCase( replace( pages.name[x], '.md', p ) ), pageNameLen - 14);


			content[x] = {
				title : item.meta.title,
				date 	: #DateTimeFormat( item.meta.date, application.settings.dateFormat )#,
				body  : application.m.markdown( item.body ),
				url 	: pageUrl
			};


		}

		return content;

	}

}

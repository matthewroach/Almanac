
	<cfinclude template = "#_settings.templates.header#" />

	<cfoutput>

	</cfoutput>

	<cfloop collection="#page.content#" item="item"><cfoutput>
	<div class="post">
		<h1><a href="/?/#_settings.url#/#page.content[item].url#">#page.content[item].title#</a></h1>
		<div class="misc">
			Posted on : #page.content[item].date#
		</div>
	</div>
	</cfoutput></cfloop>

	<cfinclude template = "#_settings.templates.footer#" />

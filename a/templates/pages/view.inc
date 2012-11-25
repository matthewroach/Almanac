
	<cfinclude template = "#_settings.templates.header#" />

	<div class="article">
		<cfoutput>
			<h1>#page.meta.title#</h1>

			#page.body#

		</cfoutput>

	</div>

	<cfinclude template = "#_settings.templates.footer#" />

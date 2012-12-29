<cfcontent type="text/xml" reset="true" /><?xml version="1.0" ?>
<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">
<atom:link href="  #### FEED URL #### " rel="self" type="application/rss+xml" />

<channel>

<title>    FEED TITLE     </title>
<description>    DESCRIPTION   </description>
<link>    FULL URL TO YOUR SITE     </link>

	<cfloop collection="#page.content#" item="item"><cfoutput>
		<item>
			<title>#page.content[item].title#</title>
			<description>#XMLFormat( page.content[item].body )#</description>
			<link>http://    URL HERE     /?/#_settings.url#/#page.content[item].url#</link>
		</item>
	</cfoutput></cfloop>

</channel>

</rss>

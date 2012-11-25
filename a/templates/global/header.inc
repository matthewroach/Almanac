<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

  <title><cfoutput><cfif isDefined( 'page.title' )>#page.title# | </cfif>#_settings.title#</cfoutput></title>

  <meta name="viewport" content="width=device-width, initial-scale=1.0" />

  <cfset siteCss = [
    "/a/css/reset.css",
    "/a/css/flu.css",
    "/a/css/styles.css"
  ]>
  <cfstylesheet src="#siteCss#" path="/" media="screen,projection" minimize="true" />

</head>
<body>

	<div class="container">
    <div class="main">

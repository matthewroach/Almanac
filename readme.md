# Almanac

An [OpenBD](http://openbd.org "OpenBD") (ColdFusion) blog powered by static JSON / markdown files.

This is a simple solution I made to power my own blog, to use two items I love, JSON and Markdown. The idea is to have a simple blog that does not rely on a database, so it's lightweight and easy to use, simple to maintain and can be hosted on the smallest VPS you can find. (Obviously not too small as you need to run the CFML Engine ;) ).


## Getting Started


Take a copy of the this repository, either dowload the zip or fork it.

This repository contains everything OpenBD related to get you started, but you will need some software or a server to get up and running to try it out. If you are familiar with running up ColdFusion sites or in particular OpenBD you'll know what your doing. If not depending on where you wish to have this running will depending on what you require

## Requirements

- A copy of Almanac, includes OpenBD
- A computer or server (see instructions below for each)
	- With Java 1.6
	- Jetty Desktop Laucher / Ready2Run

### Running Locally

To run this locally on your computer you need to ensure you have Java installed on your machine, I recommend 1.6. If you're on a Windows machine you can use the [Jetty Desktop Launcher](http://www.aw20.co.uk/codegarden/jettylauncher/) to run up the application, or if you are on a linux based machine you can use the [Ready2Run](http://openbd.org/download/nightly/jetty-openbd.zip) download from the OpenBD website.

#### Windows

1. Download the Jetty Desktop Launcher ( [Download](http://www.aw20.co.uk/codegarden/jettylauncher/) - Instructions on site )
2. Open Jetty Desktop Launcher
	1. Enter Name
	2. Choose the folder where you have downloaded Almanac
	3. Enter port number
	4. Save, then Start, within a few seconds you will see a Goto Web App button, click this and it will open your default web browser showing you Almanac

#### Linux / Server

The following instructions can be used for linux based computers or on a linux server. Obviously if you are going to deploy to the internet you need to lock down your server on top of these instructions.

1. Download the OpenBD Read2Run Nightly Build ( [Download](http://openbd.org/download/nightly/jetty-openbd.zip) )
2. Extract the zip to a folder named jetty-openbd
3. Make an almanac folder inside of the jetty-openbd/webapps  folder
4. Copy the contents of Almanac you downloaded at the start into the newly create almanac folder
5. Open the file openbd.xml location in the jetty-openbd/contexts folder and change the line 22 to the following :

	`<Set name="war"><SystemProperty name="jetty.home" default="."/>/webapps/almanac</Set>`

6. By default Jetty will run on Port 8080, but if you wish to change this open the file jetty.xml in jetty-openbd/etc/ and change the port number on line 40, it looks like :

	`<Set name="port"><Property name="jetty.port" default="8080"/></Set>`

7. In terminal navigate yourself to the jetty-openbd folder and use the following command:

	`java -jar start.jar`

8. Within a few seconds you will be able to access you site at :

	`http://127.0.0.1:8080/` - Change port number if you changed it in step 6



### Configuring Almanac

Now you have Almanac all up and running you can now start to play around with it.

There are some basic settings associated with Almanac to tell it where to look for your blog posts, templates, the url prefix you wish to use, date format, and how many posts you wish to have on your homepage.

The settings file is located in the root, and called settings.json and the default settings are :

	{

		"title" 		: "Almanac",
		"url" 			: "blog",
		"homeCount" 	: 3,
		"pageFolder"	: "pages",

		"dateFormat"	: "EEEE, d MMMM yyyy",

		"templates" : {
			"home" 	 : "/a/templates/index.inc",
			"header" : "/a/templates/global/header.inc",
			"footer" : "/a/templates/global/footer.inc",
			"view" 	 : "/a/templates/pages/view.inc",
			"_404" 	 : "/a/templates/error/404.inc"
		}
	}


**Title**

This is what appears in the title bar on everypage, on article view pages it appears after the article title

**URL**

This is used to tell the system what url you wish to use to access you individual article. So you default view article URL would look like `http://127.0.0.1/?/blog/hello-world`

**homeCount**

This tells the system how many articles to display on the homepage of you site, if you put a number higher than the amount of articles you have in your system it will only render the ones that are avialble.

**pageFolder**

This is the folder where you will store your .md article files, this is relative from the root, we default to a pages folder inside of the root directory

**dateFormat**

The format you want dates to appear on the site in. We use the OpenBD [DateTimeFormat Function](http://openbd.org/manual/?/function/datetimeformat) have a look there for the masks available and what they output.
The default would output the following stamp : `Thursday, 26 January 2012`

**Templates**

The templates object is a list of templates and their location from the root folder.


### Page Format

We use a mixture of JSON and Markdown for our page format files, the pages are located in the folder specified in the "pageFolder" setting from your settings.json file.

The page naming convention I use is : `YYYY-MM-DD-title-of-article.md` which can translate into `2012-11-25-hello-world.md`

We structure the file in a JSON format with the body being in Markdown format

	{
		"meta" : {
		"title" : "Hello World",
		"date" : "2012-01-26"
		},

		"body" : "# Markdown Format Body"
	}


The file is self explanitory, the title is the title of your article, the date, is the date you wish to associated with the article, and the body is the Markdown format body for your article.

**Note** As the body is wrapped inside double quotes "", when Markdown uses double quotes in it's syntax you need to replace them with single quotes ' '.



# Examples

I am running my own blog using Almanac : [matthewroach.me](http://matthewroach.me) on a VPS from [Digital Ocean](https://www.digitalocean.com/?refcode=a8df971bd278)


# License

Release under GNU General Public License, version 3 (GPL-3.0) - See [license.txt](license.txt)


#### Credits

Help with coming up with the name to follow along with my obsession of Back to the Future names for projects : [Stuart Robson - alwaystwisted.com](http://www.alwaystwisted.com/ "Slightly Bizarre Ramblings Of A Front-End Developer")

My amazing wife [@pamelaroach](http://twitter.com/pamelaroach) for being supportive and proof reading for me




GET OR POST DATA TO OR FROM A WEB SERVER WITHOUT A WEB BROWSER

I. DISCLAIMER

Please see the disclaimer at http://www.freevbcode.com/legal.htm regarding this code.  Basically it says you can't post this code on another site, and you can't sell the source code for profit (but you can do anything you want with a binary compiled version).  If you have a more specific questions about restrictions on the use this code (or other code developed by FreeVBCode.com) check the disclaimer. 


II.  INTRODUCTION

This application demonstrates how to post or request data to a web page or script without a web browser, using the Internet API functions contained in WinInet.dll. 

For the application to work, the system must have Internet Explorer 3.1 or above installed on it.  In addition, Visual Basic 6 is required, due to the use of the Scripting.Runtime Libraries (unless you installed this library yourself on a machine with VB 5). 

The application demonstrates 3 types of http requests:  A POST request, a GET request, and (for lack of a better term), what I will call a simple request, or one that does not send form data as parameters.

It is assumed you have a basic understanding of the meaning of POST and GET requests.  If not, I'll give you this much: A get request is one that has a query string in the URL (e.g., http://www.freevbcode.com/ShowCode.asp?ID=110 -- the query string begins after the question mark).  A post request comes from an HTML page with form data (e.g., HTML text input boxes).

III.  THIS PACKAGE

This package includes the following:

--  All the files and code necessary to run the application in the VB IDE: frmClient.frm, frmClient.frx, frmResponse.frm, frmResponse.frx, Utils.bas, SmartRegistry.cls, InternetClient.vbp.

-- A sample .asp file (ServerVariables.asp), which, if you would like, you can use with this application to see how it works.

-- A compiled version of the application (InternetClient.exe)

IV.  HOW TO USE THE PROGRAM

A.  Using the program with the supplied sample ASP script

The sample script takes the names of server variables as parameters of a post request and returns their values.  Though you can get as many server variables as you want, the script takes only one parameter: the different server variables are delimited by the : character.

To use this script do the following:

1.  Upload the sample script to your IIS web server.

2.  Enter the server name in the server name text box. Do not include "http://" as part of the server name (the first time you run the program, the server name defaults to the computer name, making it easy to use if you are running the web server on the same machine you are running this application).

3.  In the Script or HTML page text box, you will see "ServerVariables.asp".  Don't change this.

4.  In the 1st Name text box, you will see "ServerVars".  Don't change this.

4.  In the first Value text box, you will see the value "LOCAL_ADDR:SERVER_SOFTWARE:HTTP_HOST".   In other words, the program is asking the script to return these three server variables.  Only change this if you would like to retrieve a different set (or more) server variables.

5.  Click the Post Request Button.  The results will be returned with the HTML stripped.


B.  Using the program with other web pages or ASP/CGI programs.

1.  To request a web page that does not take form data as parameters (e.g., a static web page) enter the server name in the Server Name text box and the HTML page in the Script or HTML page text box.  Click the Post Request Button:

Example:  Server Name: www.yahoo.com
          Script or HTML Page: index.html

2.  To request results from a script that uses the GET request method, follow step 1, select GET as the Request Method, and enter up to 8 name/value pairs in the Name and Value text Boxes.

Example: Server Name: infoseek.go.com
	 Script or HTML Page: Titles
	 Name: qt
	 Value: Visual Basic
         (Don't forget to choose the GET option button, leave the other name/value boxes blank)

3.  To post data to a script that uses the POST request method, follow step 1, select POST as the Request Method, and enter up to 8 name/value pairs in the Name and Value text Boxes.

Example: Server Name: www.freevbcode.com
	 Script or HTML Page: newsletter.asp
	 Name: Name
	 Value: [Your Name]
   
         Name: Email	
	 Value: [Your Email Address]
         
	 Name: Available
	 Value: YES

	 Name: SendSubscription
	 Value: Submit

(NOTE: This wil subscribe you to the FreeVBCode.com newsletter)
# Midterm Revision

## HTML

1. HTML general structure
2. HTML tags: <p>, <a>, <img>

## CSS

1. /<link/> & /<style/> usage
2. dot character & # character
3. pseudo elements and classes
4. box model

## JavaScript and JSON
1. "last updated on ..." 
<!-- document.write("Last updated on " + document.lastModified + ".")-->
2. Fatorial table
3. XMLHttpRequest 
<!-- var req = new XMLHttpRequest();
	req.open("GET", "url", true/false);
	req.onreadystatechange = myfunction;
	req.send();
	JSON.parse(req.responseText);-->

## Forms
1. &lt; input &gt; CHECKBOX | FILE | HIDDEN | IMAGE | PASSWORD | RADIO | RESET | SUBMIT | TEXT
2. &lt; SELECT &gt; OPTION

## DOM
1. useful functions: getElementByID("xx"), getElementsByTagName("font"), innerHTML
2. fading text example
<!-- function fadeText(){
	document.getl...style.color = ...;
	setTimeout("fadetext()", 20);
}-->
3. move obj horizontally
<!-- getElementByID('a').style.left = '600px'; -->
4. reverse nodes <!-- 
for (var i = num - 1; i >= 0; i --){
	var c = n.removeChild(kids[i]);
	n.appendChild(c);
}-->
5. letter spacing
6. window open

## HTTP
1. keep alive
2. HTTP request methods
3. Response Header
4. Entity Tags -> web server 
5. X-Frame-Options: Sameorigin
6. CORS header 允许 corss site.  (ACAO:origin.com)

## Web Serves
1. how handle multiple request
2. app web server
3. Apache web server
4. conf, htdocs, logs, cgi-bin, icons, src
5. &lt; limit&gt; 

## JS Advanced
1. window open
<!-- newWin = open(url, name, xxx)-->
2. navigator - appName, appVersion, cookieEnabled, languague...
3. work with Radio buttons
4. add event
5. multiselection

## Special questions

4. How do you sign up for a domain name, say www.indotennis.com?
You register the domain name with an ICANN approved registrar.

5. Name two critical features of your web server you will need to configure in order to host the website?
Server Root, Document Root, Location of Server side scripts

10. What file or file(s) have to be created/set in order to establish a secure directory?
.htaccess and .htpasswd

String: startsWith, endsWith, includes
```javascript
re = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}/;
re.test()
```

```javascript
xmlhttp.open("GET", "url", false)
xmlhttp.send()
```





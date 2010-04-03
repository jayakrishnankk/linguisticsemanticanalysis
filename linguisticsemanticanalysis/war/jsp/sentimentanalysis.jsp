<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sentiment Analysis</title>
<link rel="stylesheet" type="text/css" href="../css/main.css" />
<script src="http://yui.yahooapis.com/2.8.0r4/build/yuiloader/yuiloader-min.js"></script>
<script type="text/javascript">
	var loader = new YAHOO.util.YUILoader({
	 
	    // Identify the components you want to load.  Loader will automatically identify
	    // any additional dependencies required for the specified components.
	    require: ["connection", "json"],
	 
	    // Configure loader to pull in optional dependencies.  For example, animation
	    // is an optional dependency for slider.
	    loadOptional: true,
	 
	    // The function to call when all script/css resources have been loaded
	    onSuccess: function() {
	        //this is your callback function; you can use
	        //this space to call all of your instantiation
	        //logic for the components you just loaded.
	    },
	 
	    // Configure the Get utility to timeout after 10 seconds for any given node insert
	    timeout: 10000,
	 
	    // Combine YUI files into a single request (per file type) by using the Yahoo! CDN combo service.
	    combine: true
	});
	 
	// Load the files using the insert() method. The insert method takes an optional
	// configuration object, and in this case we have configured everything in
	// the constructor, so we don't need to pass anything to insert().
	loader.insert();

</script>
<script type="text/javascript">
	function txtSearchFocusIn() {
		if (document.searchForm.txtSearchTerm.value == "Enter Movie Name") {
			document.searchForm.txtSearchTerm.value = "";
		}
		document.searchForm.txtSearchTerm.style.color = "#000000";
	}

	function txtSearchFocusOut() {
		if (document.searchForm.txtSearchTerm.value == "") {
			document.searchForm.txtSearchTerm.value = "Enter Movie Name";
		}
		document.searchForm.txtSearchTerm.style.color = "#AAAAFF";
	}

	function txtSearchKeyup(e) {
		var keycode;
		if (window.event) keycode = window.event.keyCode;
		else if (e) keycode = e.which;
		else return true;

		if (keycode == 13)
		{
			sendReviewRequest();
		   	return false;
		}
		else
		   return true;
	}
	
	function sendReviewRequest() {
		var searchTerm = document.searchForm.txtSearchTerm.value;
		var url = "getAPIResults.jsp?movieName="+searchTerm;
		var transaction = YAHOO.util.Connect.asyncRequest('GET', url, handleAPIResult, null);
	}
	
	function getReviewContent(url) {
		var transaction = YAHOO.util.Connect.asyncRequest('GET', url, handleReviewResult, null);
	}

	var handleReviewResult = {
		success: function(o) {
			alert(o.responseText);
		},
	  	failure: function(o) {
			alert(o.responseText+"123");
		},
	  	argument: []
	};

	var handleAPIResult = {
		success: function(o) {
			var responseXML = o.responseXML;
			var reviews = responseXML.firstChild.getElementsByTagName("review");
			var reviewsArray = [];
			for (var i=0; i< reviews.length; i++) {
				reviewsArray.push(reviews[i].getElementsByTagName("link")[0].getElementsByTagName("url")[0].textContent);
			}
			alert(reviewsArray.join("\n"));
			getReviewContent(reviewsArray[0]);
		},
	  	failure: function(o) {
			alert(o.responseText);
		},
	  	argument: []
	};
	
</script>
</head>
<body>
<table cellpadding="0" cellspacing="0" width="100%" height="100%" align="center" background="#DDDDDD" class="container">
<tr><td align="center" width="100%" height="100%">
<div id="body">
	<jsp:include page="common/header.jsp">
		<jsp:param value="" name=""/>
	</jsp:include>
	<div id="searchForm">
		<form name="searchForm">
			<table width="100%" height="100%" cellpadding="0" cellspacing="0" align="left">
				<tr align="left">
					<td width="100">&nbsp;</td>
					<td width="300">
						<input type="text" name="txtSearchTerm" class="txtInput" value="Enter Movie Name"
							onfocus="txtSearchFocusIn()" onblur="txtSearchFocusOut()" onkeyup="txtSearchKeyup(event)"/>
					</td>
					<td><input type="button" class="btnSearch" onclick="sendReviewRequest()"/></td>
				</tr>
			</table>	
		</form>
	</div>
	<div id="resultsForm">
<%
	String searchTerm = request.getParameter("txtSearchTerm");
	

%>
	</div>
</div>
</td></tr>
</table>
</body>
</html>
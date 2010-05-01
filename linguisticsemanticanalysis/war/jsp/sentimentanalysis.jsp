<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sentiment Analysis</title>
<link rel="stylesheet" type="text/css" href="../css/main.css" />
<link rel="stylesheet" type="text/css" href="../css/sentiment.css" />
<script src="http://yui.yahooapis.com/2.8.0r4/build/yuiloader/yuiloader-min.js"></script>
<script type="text/javascript">
	var loader = new YAHOO.util.YUILoader({
	    require: ["connection", "json"],
	    loadOptional: true,
	    onSuccess: function() {},
	    timeout: 10000,
	    combine: true
	});
	 
	loader.insert();
</script>
<script type="text/javascript">
	function findSentiment() {
		var params = [];
		params[params.length] = "txtMovieName="+document.sentimentForm.txtMovieName.value.replace("&", "%26");
		params[params.length] = "txtReviewContent="+document.sentimentForm.txtReviewContent.value.replace("&", "%26");
		var url = "<%=request.getContextPath()%>/singleMovieSentiment.htm";
		var transaction = YAHOO.util.Connect.asyncRequest('POST', url, handleAPIResult, params.join("&"));
		document.getElementById("sentimentIconHolder").className = "loading";
	}

	var handleAPIResult = {
		errorCount: 0,
		errorMessages: [
		        		"An unexpected error happened. Please try again.",
		        		"Oops! This might be a problem with the network connectivity.",
		        		"Well, it seems you are not lucky today.",
		        		"Very sorry for your inconvenience. We will make sure this will not happen again. Have a great Day."],
		success: function(o) {
			this.errorCount=0;
			if (o.responseText == "pos") {
				document.getElementById("sentimentIconHolder").className = "pos";
			} else if (o.responseText == "neg") {
				document.getElementById("sentimentIconHolder").className = "neg";
			} else {
				document.getElementById("sentimentIconHolder").className = "";
			}
			alert(o.responseText);
		},
	  	failure: function(o) {
		  	alert(this.errorMessages[this.errorCount]);
		  	if (this.errorCount < 3) this.errorCount++;
		  	document.getElementById("sentimentIconHolder").className = "";
		},
	  	argument: []
	};
		
	function assignPositive() {
		alert('assign positive');
	}

	function assignNegative() {
		alert('assign negative');
	}

	function rebuildModel() {
		alert('rebuild model');
	}

	function gotoDBAnalysis() {
		alert('view database analysis');
	}
</script>
</head>
<body>
<table cellpadding="0" cellspacing="0" width="100%" height="100%" align="center" background="#DDDDDD" class="container">
<tr><td align="center" width="100%" height="100%">
<div id="body">
	<jsp:include page="common/header.jsp">
		<jsp:param value="" name=""/>
	</jsp:include>
	<div class="spacer10"></div>
	<form name="sentimentForm">
	<div class="movieReviewContainer">
		<div id="moviewReviewContent">
			<div class="formItem">
				<span class="bold">Movie name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
				<span><input type="text" id="txtMovieName" name="txtMovieName" /> </span>
			</div>
			<div class="bold">Review Content:</div>
			<div>
				<textarea rows="10" cols="90" name="txtReviewContent"></textarea>
			</div>
		</div>
		<div>
			<span><input type="button" value="Find Sentiment" onclick="findSentiment()"/></span>
			<table align="center" width="100%"><tr><td width="100%" align="center"><div id="sentimentIconHolder"></div></td></tr></table>
		</div>
		<div class="spacer10"></div>
		<div class="wrongSentimentDialog">
			Do you think the sentiment shown above is wrong?
			Click on Positive if you think the sentiment is positive.
			Click on Negative if you think the sentiment is negative.
		</div>
		<div class="warning">
			If you press this button, this movie review will go into the training schema. 
			Please take care while selecting this because it may affect the further sentiment analysis.
			Hence, make your selection only if you are absolutely sure that you are selecting the correct sentiment.
		</div>
		<div>
			<input type="button" value="Positive" onclick="assignPositive()"/> 
			<span class="spacer10">&nbsp;</span>
			<input type="button" value="Negative" onclick="assignNegative()"/>
		</div>
		<div class="spacer10"></div>
		<div class="spacer10"></div>
		
		<table><tr>
			<td><div class="infoIcon"></div></td>
			<td>
				<div class="info">
					Sentiment analysis involves classifying opinions in text into categories like "positive" or "negative".
					The classifier evaluation framework will compile the training database into a sentiment analysis model for later use.
				</div>
			</td>
		</tr></table>
		
		<div>
			<table><tr>
				<td><input type="button" value="Rebuild the model" onclick="rebuildModel()"/></td>
				<td width="100%"></td>
				<td><input type="button" value="More.." onclick="gotoDBAnalysis()"> </td>
			</tr></table>
		</div>
	</div>
</form>

	<table cellpadding="0" cellspacing="0" width="100%"><tr>
		<td><img alt="" src="../images/home/header-hl-left.png"></img></td>
		<td width="100%" style="background-image: url('../images/home/header-hl-mid.png'); background-repeat: repeat-x"></td>
		<td><img alt="" src="../images/home/header-hl-right.png"></img></td>
	</tr></table>
	
	<div id="footer">Project By Greeshma T.R.</div>
</div>
</td></tr>
</table>
</body>
</html>
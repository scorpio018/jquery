<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'middel.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="js/prototype.js"></script>
<script src="js/jquery-1.3.2.js" type="text/javascript"></script>
<script type="text/javascript">
	// Method invoked when user changes letter range
	function searchAddressBook() {
		// Select values from HTML select lists
		var fromLetter = $("#fromLetter").val();
		var toLetter = $("#toLetter").val();
		// Prepare parameters to send into REST web service
		var pars = "from=" + fromLetter + "&to=" + toLetter;
		// Define REST web service URL 
		var url = "jqueryjson.action";

		// Make web service Ajax request via prototype helper, 
		// upon response, call showResponse method	
		$.ajax({
			url : url,
			type : "POST",
			data : pars,
			dataType : "json",
			complete : function(data) {
				// Get JSON values 
				var jsonRaw = data.responseText;
				// Eval JSON response into variable 
				var jsonContent = eval("(" + jsonRaw + ")");

				// Create place holder for final response    
				var finalResponse = "<b>"
						+ jsonContent.addressbook.length
						+ " matches found in range</b><br/>";

				// Loop over address book length.
				for ( var i = 0; i < jsonContent.addressbook.length; i++) {
					finalResponse += "<hr/>";
					finalResponse += "<i>Name:</i> "
							+ jsonContent.addressbook[i].name + "<br/>";
					finalResponse += "<i>Address:</i> "
							+ jsonContent.addressbook[i].address.street
							+ " -- "
							+ jsonContent.addressbook[i].address.city
							+ ","
							+ jsonContent.addressbook[i].address.zip
							+ ".<br/>";
					finalResponse += "<i>Telephone numbers:</i> "
							+ jsonContent.addressbook[i].phoneNumbers[0]
							+ " & "
							+ jsonContent.addressbook[i].phoneNumbers[1]
							+ ".";
				}

				// Place formatted finalResponse in div element
				document.getElementById("addressBookResults").innerHTML = finalResponse;
			}
		});
		/* new Ajax.Request(url, {
			method : 'get',
			parameters : pars,
			onComplete : showResponse
		}); */
	}
	// Method invoked when page receives Ajax response from REST web service 
	/* function showResponse(originalRequest) {
		// Get JSON values 
		var jsonRaw = originalRequest.responseText;
		// Eval JSON response into variable 
		var jsonContent = eval("(" + jsonRaw + ")");

		// Create place holder for final response    
		var finalResponse = "<b>" + jsonContent.addressbook.length
				+ " matches found in range</b><br/>";

		// Loop over address book length.
		for (var i = 0; i < jsonContent.addressbook.length; i++) {
			finalResponse += "<hr/>";
			finalResponse += "<i>Name:</i> " + jsonContent.addressbook[i].name
					+ "<br/>";
			finalResponse += "<i>Address:</i> "
					+ jsonContent.addressbook[i].address.street + " -- "
					+ jsonContent.addressbook[i].address.city + ","
					+ jsonContent.addressbook[i].address.zip + ".<br/>";
			finalResponse += "<i>Telephone numbers:</i> "
					+ jsonContent.addressbook[i].phoneNumbers[0] + " & "
					+ jsonContent.addressbook[i].phoneNumbers[1] + ".";
		}

		// Place formatted finalResponse in div element
		document.getElementById("addressBookResults").innerHTML = finalResponse;
	} */
</script>
</head>

<body>
	<h4 style="text-align:left">Request address book matches:</h4>
	<table style="text-align:left" cellpadding="15">
		<tr>
			<td valign="top">From:<br /> <select id="fromLetter"
				onchange="searchAddressBook()">
					<!-- <option>Mary Lebow</option>
	<option>Sally May</option>
	<option>John Kim</option>
	<option>Richard Thorn</option> -->
					<option value="A">A</option>
					<option value="B">B</option>
					<option value="C">C</option>
					<option value="D">D</option>
					<option value="E">E</option>
					<option value="F">F</option>
					<option value="G">G</option>
					<option value="H">H</option>
					<option value="I">I</option>
					<option value="J">J</option>
					<option value="K">K</option>
					<option value="L">L</option>
					<option value="M">M</option>
					<option value="N">N</option>
					<option value="O">O</option>
					<option value="P">P</option>
					<option value="Q">Q</option>
					<option value="R">R</option>
					<option value="S">S</option>
					<option value="T">T</option>
					<option value="U">U</option>
					<option value="V">V</option>
					<option value="W">W</option>
					<option value="X">X</option>
					<option value="Y">Y</option>
					<option value="Z">Z</option>
			</select></td>
			<td valign="top">To:<br /> <select id="toLetter"
				onchange="searchAddressBook()">
					<option value="A">A</option>
					<option value="B">B</option>
					<option value="C">C</option>
					<option value="D">D</option>
					<option value="E">E</option>
					<option value="F">F</option>
					<option value="G">G</option>
					<option value="H">H</option>
					<option value="I">I</option>
					<option value="J">J</option>
					<option value="K">K</option>
					<option value="L">L</option>
					<option value="M">M</option>
					<option value="N">N</option>
					<option value="O">O</option>
					<option value="P">P</option>
					<option value="Q">Q</option>
					<option value="R">R</option>
					<option value="S">S</option>
					<option value="T">T</option>
					<option value="U">U</option>
					<option value="V">V</option>
					<option value="W">W</option>
					<option value="X">X</option>
					<option value="Y">Y</option>
					<option value="Z">Z</option>
			</select></td>
			<td valign="top">
				<h5>Results</h5>
				<div style="text-align:left" id="addressBookResults">Please
					select range</div></td>
		</tr>
	</table>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Settings</title>
<script>
	function changeCSS(cssFile, cssLinkIndex) {

		var oldlink = document.getElementsByTagName("link").item(cssLinkIndex);

		var newlink = document.createElement("link");
		newlink.setAttribute("rel", "stylesheet");
		newlink.setAttribute("type", "text/css");
		newlink.setAttribute("href", cssFile);

		document.getElementsByTagName("head").item(0).replaceChild(newlink,
				oldlink);
	}

	
	function button_clickHandler(theme) {
		if(theme == 'dark'){
			 document.getElementById('buttonClicked').value = 1;
			 
		} else if (theme == 'light'){
			 document.getElementById('buttonClicked').value = 2;
			    
		} else if (theme == 'pastel'){
			 document.getElementById('buttonClicked').value = 3;
			    
		} else if (theme == 'original'){
			document.getElementById('buttonClicked').value = 4;
		}
		
		document.getElementById('themeForm').submit();
	}
	
</script>

<link rel="stylesheet" type="text/css" href="css/original.css" />

</head>
<center>
	<body>
	
	<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>

<%
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "db1?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
String userId = "root";
String password = "Database2019";

Connection connection = null;
Statement statement = null;

try {
	

	Class.forName(driverName);
	connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
	
	PreparedStatement stmt = connection.prepareStatement("select link from themes where id=? limit 1");
	stmt.setString(1, request.getParameter("themeId"));

	System.out.println(stmt);
	
	ResultSet rs1 = stmt.executeQuery();
	
	while (rs1.next()) {
		
		String link = rs1.getString("link");
		
		out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\""
				+ link + "\"/></head>\n");
	
	}

%>
	
		<h1>
			<b>Change Theme</b>
		</h1>

		<p>Click below to change theme!</p>
		
		<form action="SettingsProcess" method='GET' id='themeForm'>
		
		<input type="button" class='button' value="Dark" id="dark" name="dark"
			onclick="changeCSS('css/dark.css', 0); button_clickHandler('dark');" >
			
		<input type="button" class='button' value="Light" id="light" name="light"
			onclick="changeCSS('css/light.css', 0); button_clickHandler('light');">
			
		<input type="button" class='button' value="Pastel" id="pastel" name="pastel"
			onclick="changeCSS('css/pastel.css', 0); button_clickHandler('pastel');">
		
		<input type="button" class='button' value="Original" id="original" name="original"
			onclick="changeCSS('css/original.css', 0); button_clickHandler('original');">
			
		<input type="hidden" id="buttonClicked" name="buttonClicked">
	
		</form>

<%} catch (Exception e) {
	out.println(e.getMessage());
} %>

	</body>
</center>
</html>

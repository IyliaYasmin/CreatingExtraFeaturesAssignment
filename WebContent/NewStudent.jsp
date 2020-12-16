<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register New Student</title>

<link rel="stylesheet" type="text/css" href="css/original.css" />

</head>
<center>
	<body>

		<%@ page import="java.io.*"%>
		<%@ page import="java.util.*"%>
		<%@ page import="java.sql.*"%>

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

				out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"" + link + "\"/></head>\n");

			}
		%>


		<form action="NewStudentProcess" method="GET">

			<h1>
				<b>Register New Student</b>
			</h1>

			<p>
				Student ID: <input type="text" name="newid" />
			</p>
			<p>
				Password: <input type="password" name="newpassword" />
			</p>
			<p>
				Name: <input type="text" name="newname" />
			</p>
			<p>
				Department(CTN/M/CS/IS): <input type="text" name="newdepartment">
			</p>
			<p>
				Malay: <input type="text" name="malay" />
			</p>
			<p>
				English: <input type="text" name="english" />
			</p>
			<p>
				Math: <input type="text" name="math" />
			</p>
			<p>
				Science: <input type="text" name="science" />
			</p>

			<input type="hidden" id="themeId" name="themeId"
				value=<%=request.getParameter("themeId")%>>

			<button class='button' type="submit">
				<span>Submit</span>
			</button>
		</form>

<br></br>
		<form action="Settings.jsp" method='GET' id='themeForm'>
			<input type="hidden" id="themeId" name="themeId"
				value=<%=request.getParameter("themeId")%>>
			<button class='button' type='submit'>
				<span>Settings</span>
			</button>

		</form>

		<br></br>

		<%
			} catch (Exception e) {
			out.println(e.getMessage());
		}
		%>

	</body>
</center>
</html>
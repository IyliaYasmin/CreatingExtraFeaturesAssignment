
//Import required java libraries
import java.io.*;
import java.util.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;


//Extend HttpServlet class
public class HelloForm extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// Set response content type
		response.setContentType("text/html");

		PrintWriter out = response.getWriter();
		String title = "Student Portal";
		String welcome = "Hello ";
		String docType = "<!doctype html public \"-//w3c//dtd html 4.0 " + "transitional//en\">\n";

		//for Student Portal title and welcome message
		out.println(docType + "<html>\n" + "<head><title>" + title + "</title>" 
				+ "<link rel=\"stylesheet\" type=\"text/css\" href=\"css/original.css\"/></head>\n"
				+ "<center><body>\n");
				
				
				
				boolean login = false;

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

					PreparedStatement stmt = connection.prepareStatement("select name from student where id =? and password =?");
					stmt.setString(1, request.getParameter("id"));
					stmt.setString(2, request.getParameter("password"));

					System.out.println(stmt);
					ResultSet rs = stmt.executeQuery();

					if (rs.next()) {
						login = true;
					}

				} catch (Exception e) {
					out.println(e.getMessage());
				}

				if (login) {
				
				
				out.println("<h1 align = \"center\">" + title + "</h1>\n" + "<center><b>"
				+ welcome + "</b>" + "<b>" + request.getParameter("id") + ", </b>\n" + "<b>your password is "
				+ request.getParameter("password") + ".</center>");
				
				try {
					statement = connection.createStatement();
					ResultSet rs = statement.executeQuery("select id, name, department, malay, english, math, science, avg_marks from student");

					out.println("<p></p>"
					+ "<a href=\"NewStudent.jsp\">"
					+	"<button type='edit'>Add New Student</button>"
					+ "</a>"
					+ "<p></p>"
					+ "<table id=\"students\">"
					+	"<table border=\"1\">"
					+		"<tr>"
					+			"<th>Student ID</th>"
					+			"<th>Name</th>"
					+			"<th>Department</th>"
					+			"<th>Malay</th>"
					+			"<th>English</th>"
					+			"<th>Science</th>"
					+			"<th>Math</th>"
					+			"<th>Average Marks</th>"
					+		"</tr>");
					
					while (rs.next()) {
					
						double averageMarks = (rs.getDouble("malay") + rs.getDouble("english") + rs.getDouble("science") + rs.getDouble("math"))/4;
					
						out.println("<tr>"
						+ "<td>" + rs.getString("id") + "</td>"
						+ "<td>" + rs.getString("name") + "</td>"
						+ "<td>" + rs.getString("department") + "</td>"
						+ "<td>" + rs.getString("malay") + "</td>"
						+ "<td>" + rs.getString("english") + "</td>"
						+ "<td>" + rs.getString("science") + "</td>"
						+ "<td>" + rs.getString("math") + "</td>"
						+ "<td>" + averageMarks + "</td>"
					+ "<tr>");

						
							}
						
					
					out.println("</table>");
					
					out.println("<br></br>"
					+ "<p>"
					+	"<a href=\"Settings.jsp\" class='button'>Settings</a>"
					+ "</p>"
					+ "<br></br>");

				
					} catch (Exception e) {
					out.println(e.getMessage());
				}
				} else {
				
				
					out.println("Login failed!<a href=\"Home.jsp\">\"Login back?\"</a>");
				
				
					}
					
				out.println("</center></body></html>");
				
	}
}


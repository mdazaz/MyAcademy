<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.bean.Students" %>
<%@ page import="com.dao.StudentDAO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Learner's Academy</title>
<jsp:include page="links.jsp"></jsp:include>
</head>
<body>
<jsp:include page="nav.jsp"></jsp:include>

<div class="container-fluid div-bg pt-5" >
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6">
		<div class="h3">Students</div><br>
			<table class="table table-bordered">
				<thead class="table-primary">
					<th>ID</th>
					<th>Name</th>
					<th>Class</th>
				</thead>
				<tbody>
					<%
						List<Students> listOfStudents = StudentDAO.listStudents();
						for(Students stud: listOfStudents){
							if(!(stud.getName().equals(""))){
								out.print("<tr>");
								out.print("<td>"+stud.getId()+"</td>");
								out.print("<td>"+stud.getName()+"</td>");
								out.print("<td>"+stud.getClasses().getName()+"</td>");
								out.print("</tr>");
							}
						}
					%>
				</tbody>
			</table>
		</div>
		<div class="col-md-3"></div>
	</div>
</div>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.bean.Classes" %>
<%@ page import="com.bean.Students" %>
<%@ page import="com.bean.Subjects" %>
<%@ page import="com.dao.ClassDAO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Learner's Academy</title>
<jsp:include page="links.jsp"></jsp:include>
<script type="text/javascript">
function getStutends(class_id)
{
	 window.location.href = "view-classes.jsp?class_id="+class_id;
	}

</script>
</head>
<body>
<jsp:include page="nav.jsp"></jsp:include>

<div class="container-fluid div-bg pt-5" >
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6">
		<div class="h3 ">Classes</div> <br/>
			<table class="table table-bordered">
				<thead class="table-primary">
					<th>ID</th>
					<th>Name</th>
					<th></th>					
				</thead>
				<tbody>
					<%
						List<Classes> listOfClasses = ClassDAO.listClasses();
						for(Classes cl: listOfClasses){
							out.print("<tr>");
							out.print("<td class='col-sm-2'>"+cl.getId()+"</td>");
							out.print("<td class='col-sm-4'>"+cl.getName()+"</td>");
							out.print("<td class='col-sm-3'><input type='button' class='btn btn-primary' value='View Details' name='viewStudent'onclick='getStutends("+cl.getId()+")'/></td>");
							//out.print("<td class='col-sm-2'><input type='button' class='btn btn-primary'  value='Subject' name='viewStudent'onclick='getSubjects("+cl.getId()+")'/></button></td>");
							out.print("</tr>");
						}
					%>
				</tbody>
			</table>			
	<hr />
	
	<div id="StudentDiv">
		<%
	
	String strClassId=request.getParameter("class_id");
			
	if(strClassId!=null){
		int ClassId=Integer.parseInt(strClassId);
		Classes selClass=ClassDAO.searchClassesById(ClassId);
   	List <Students> students=selClass.getStudents();
   	
   	if (students.size()>0)
   	{
   		out.print("<div class='h5'>Students of  "+selClass.getName()+"</div><br>");
   		out.print("<table class='table table-bordered'>");
   		out.print("<thead class='table-primary'>");
   		out.print("<th>ID</th><th>Name</th></thead><tbody>");
		
					for(Students stud: students){
						if(!(stud.getName().equals(""))){
							out.print("<tr>");
							out.print("<td>"+stud.getId()+"</td>");
							out.print("<td>"+stud.getName()+"</td>");							
							out.print("</tr>");
						}
					}
		
					out.print("	</tbody></table></div>");
    	}
	}
   %>

	
	<div id="SubjectDiv" style="height:200px">
		<%
			
	if(strClassId!=null){
		int ClassId=Integer.parseInt(strClassId);
		Classes selClass=ClassDAO.searchClassesById(ClassId);
   	List <Subjects> subjects=selClass.getSubject();   	
   	
   	if (subjects.size()>0)
   	{
   		out.print("<div class='h5'>Subject of  "+selClass.getName()+"</div><br>");
   		out.print("<table class='table table-bordered'>");
   		out.print("<thead class='table-primary'>");
   		out.print("<th>ID</th><th>Name</th><th>Teacher</th></thead><tbody>");
		
					for(Subjects sub: subjects){
						if(!(sub.getName().equals(""))){
							out.print("<tr>");
							out.print("<td>"+sub.getId()+"</td>");
							out.print("<td>"+sub.getName()+"</td>");
							out.print("<td>"+sub.getTeachers().get(0).getName()+"</td>");
							out.print("</tr>");
						}
					}
		
					out.print("	</tbody></table></div><br/><br/>");
    	}
	}
   %>
</div>
	
	
		</div>
		<div class="col-md-3"></div>
	</div>
</div>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
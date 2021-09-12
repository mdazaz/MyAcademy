<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="com.bean.Subjects" %>
<%@ page import="com.dao.SubjectDAO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Learner's Academy</title>
<jsp:include page="links.jsp"></jsp:include>

<script type="text/javascript">
function deleteSelectedRow(id){
	var result = confirm("Are you sure to delete?");
	if (result) {
		window.location.href="delete-subject-submit.jsp?id="+id+"&operation=DEL";
	}
     
}
</script>
</head>
<body>
<jsp:include page="nav.jsp"></jsp:include>
<div class="container-fluid" id="div-bg">
	<div id="login">
        <div class="container">
        
         <div class="card justify-content-center align-items-center">
        <div class="col-md-6">
			<table id="tblSubject" class="table table-striped">
				<thead>
					<th>ID</th>
					<th>Name</th>
					<th>Selection</th>
				</thead>
				<tbody>
					<%
						List<Subjects> listOfSubjects = SubjectDAO.listSubjects();
						for(Subjects sub: listOfSubjects){
							if(!(sub.getName().equals(""))){
								out.print("<tr>");
								out.print("<td>"+sub.getId()+"</td>");
								out.print("<td>"+sub.getName()+"</td>");
								out.print("<td><input type='button' class='btn btn-danger' value='Delete' name='delete'onclick='deleteSelectedRow("+sub.getId()+")'/></td>");
								out.print("</tr>");
							}
							
						}
					%>
				</tbody>
			</table>
		</div>
        </div>        
           
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
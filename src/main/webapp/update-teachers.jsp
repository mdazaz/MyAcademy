<%@page import="com.bean.Subjects"%>
<%@page import="com.dao.SubjectDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.bean.Teachers" %>
<%@ page import="com.dao.TeacherDAO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Learner's Academy</title>
<jsp:include page="links.jsp"></jsp:include>

<script type="text/javascript">
function getRecord(el){
	var activeRow=el.parentNode.parentNode.rowIndex;
	var tab=document.getElementById("tblSubject").rows[activeRow];
	var id=tab.getElementsByTagName("TD")[0].innerText;
	var name=tab.getElementsByTagName("TD")[1].innerText;
		
	
	document.getElementById("name").value=name;
	document.getElementById("id").value=id;
	
	
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
					List<Teachers> listOfTeachers = TeacherDAO.listTeachers();
					for(Teachers tea: listOfTeachers){
						if(!(tea.getName().equals(""))){
							out.print("<tr>");
							out.print("<td>"+tea.getId()+"</td>");
							out.print("<td>"+tea.getName()+"</td>");							
							out.print("<td><button class='btn btn-warning' onClick='getRecord(this)'>Select</button></td>");
							out.print("</tr>");
						}
					}
						
					%>
				</tbody>
			</table>
		</div>
        </div>
        
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                        <form id="login-form" class="form" action="update-teacher-submit.jsp" method="post">
                            <h3 class="text-center text-primary">Update Teacher</h3>
                            <div class="form-group">
                                <label for="id" class="text-primary">ID:</label><br>
                                <input required type="text" name="id" id="id" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="name" class="text-primary">Name:</label><br>
                                <input required type="text" name="name" id="name" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="subject-id" class="text-primary">Assign Subject:</label><br>
                                <select name="subject-id" class="form-select form-control" id="subject-id">
						<%
						List<Subjects> listOfSubjects = SubjectDAO.listSubjects();
											   	
   				if (listOfSubjects !=null && listOfSubjects.size()>0)
   				{
   					for(Subjects sub: listOfSubjects){
   			   			out.print("<option value="+sub.getId()+">"+sub.getName()+"</option>");
   					}
   				}
					
				%>
				</select>
                            </div>
                            <div class="form-group">
                            	<input type="submit" class="btn btn-primary btn-md" value="Submit">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
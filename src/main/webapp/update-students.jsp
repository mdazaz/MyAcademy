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
        <div class="col-md-7">
			<table id="tblSubject" class="table table-bordered">
				<thead class='table-primary'>
					<th>ID</th>
					<th>Name</th>
					<th>Selection</th>
				</thead>
				<tbody>
					<%
					List<Students> listOfStudents = StudentDAO.listStudents();
					for(Students stud: listOfStudents){
							if(!(stud.getName().equals(""))){
								out.print("<tr>");
								out.print("<td>"+stud.getId()+"</td>");
								out.print("<td>"+stud.getName()+"</td>");
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
                        <form id="login-form" class="form" action="update-student-submit.jsp" method="post">
                            <h3 class="text-center text-primary">Update Student</h3>
                            <div class="form-group">
                                <label for="id" class="text-primary">ID:</label><br>
                                <input required type="text" name="id" id="id" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="name" class="text-primary">Student Name:</label><br>
                                <input required type="text" name="name" id="name" class="form-control">
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
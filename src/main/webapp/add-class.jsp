<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.bean.Subjects" %>
<%@ page import="com.dao.SubjectDAO" %>
<%@ page import="com.bean.Teachers" %>
<%@ page import="com.dao.TeacherDAO" %>
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
<div class="container-fluid" id="div-bg">
	<div id="login">
        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                        <form id="login-form" class="form" action="add-class-submit.jsp" method="post">
                            <h3 class="text-center text-primary">Add Classes</h3>
                            <div class="form-group">
                                <label for="name" class="text-primary">Class Name:</label><br>
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
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String method = request.getParameter("method");
String userName = "";
if(method != null && method.trim().equals("post")) {
	userName = request.getParameter("userName");
	String password = request.getParameter("password");
	if(userName == null || !userName.trim().equals("admin")) {
		out.println("用户名不正确！");
		return;
	}
	if(password == null || !password.trim().equals("admin")) {
		out.println("密码不正确！");
		return;		
	}
	session.setAttribute("state", "adminLogined");
	response.sendRedirect("panelArticle.jsp");
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>LOGIN</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <form action="login.jsp" method="post">
    	<input type="hidden" name="method" value="post">
    	<label>用户名：</label>
    	<input type="text" name="userName" value="<%= userName %>">
    	<label>密码：</label>
    	<input type="password" name="password">
    	<input type="submit" value="login">
    </form>
  </body>
</html>

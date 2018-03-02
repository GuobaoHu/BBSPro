<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String keys = request.getParameter("keys");
if(keys == null || keys.trim().equals("")) {
	response.sendRedirect("panelArticle.jsp");
} else {
	keys = java.net.URLEncoder.encode(keys, "utf-8"); 
	response.sendRedirect("search.jsp?keys=" + keys.trim());
}
%>



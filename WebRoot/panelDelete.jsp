<%@ page language="java" import="java.util.*, java.sql.*, guyue.BBS.*" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String state = (String) session.getAttribute("state");
if(state == null || state.trim().equals("")) {
	response.sendRedirect("login.jsp");
	return;
}


//删除操作
int id = Integer.parseInt(request.getParameter("id"));
String fromUrl = request.getParameter("from");

Connection conn = DB.getConn();
String delSql = "delete from article where rootid = " + id;

DB.executeUpdate(conn, delSql);

DB.close(conn);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>panelDelete</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script src="js/jquery-3.2.1.min.js"></script>
<script language="JavaScript1.2" type="text/javascript">
	<!--
	//  Place this in the 'head' section of your page.  
	
	function delayURL(url) {
		var time = $("#time").text();
		if(time > 0) {
			time --;			
			$("#time").text(time);
		} else {
			top.location.href = url;
		}
	    setTimeout("delayURL('" + url + "')", 1000);
	}
	
	//-->
	
	</script>
	
  </head>
  
  <body>
  删除完成,<span id="time" background="yellow">3</span>秒之后进行跳转
    <br>
    如未跳转，点击<a href="<%= fromUrl %>">这里</a>
    <script type="text/javascript">
    	delayURL("<%= fromUrl %>");
    </script>
  </body>
</html>

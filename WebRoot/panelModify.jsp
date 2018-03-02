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

//1.查询id号对应的帖子的详细信息
Connection conn = DB.getConn();

int id = Integer.parseInt(request.getParameter("id"));
String fromUrl = request.getParameter("from");

Statement stmt = DB.getStmt(conn);
String sql = "select * from article where id = " + id;
ResultSet rs = DB.getRs(stmt, sql);
Article article = new Article();
if(rs.next()) {	
	article.initArt(rs);
}

DB.close(conn);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
	<script type="text/javascript">
		window.onload = function()
		{
		CKEDITOR.replace( 'cont' );
		};
	</script>
	
	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style >
		*{margin:0px}
	</style>
  </head>
  
  <body>
    <div style="height: 800px;width: 1200px;margin-left: auto;margin-right: auto">
	<div style="height: 100px;width: inherit;text-align: center;font-size: 30px;line-height: 80px">
		修改帖子
	</div>
	<form action="panelModifyOK.jsp" method="post">
		<input type="hidden" name="from" value="<%= fromUrl %>">
		<input type="hidden" name="id" value="<%= id %>">
		<div style="height: 100px;width: 70px;float: left;padding-left: 30px">
			标题:
		</div>
		<div style="height: 100px;width: 1070px;float: left">
			<input type="text" name="title" style="width: inherit" value="<%= article.getTitle() %>">
		</div>
		<div style="height: 400px;width: 70px;float: left;padding-left: 30px">
			内容:
		</div>
		<div style="height: 400px;width: 1070px;float: left">
			<textarea rows="20" name="cont" style="width: inherit"><%= article.getCont() %></textarea>
		</div>
		<div style="height: 100px;width: 70px;float: left;padding-left: 30px">
			<input type="submit" value="提交">
		</div>
	</form>	

</div>
 </body>
</html>
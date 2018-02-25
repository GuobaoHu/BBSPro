<%@ page language="java" import="java.util.*,guyue.BBS.*,java.sql.*" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
String method = request.getParameter("method");
if(method != null && method.trim().equals("post")) {
	String strId = request.getParameter("id");
	String strRootid = request.getParameter("rootid");
	String strIsleaf = request.getParameter("isleaf");
	String title = request.getParameter("title");
	String cont = request.getParameter("cont");
	//检查id,rootid,isleaf
	if(EX.checkStr(strId) || EX.checkStr(strRootid) || EX.checkStr(strIsleaf)) {
		out.println("id或rootid或isleaf数字为空!");
		return;
	}	
	int id, rootid, isleaf;
	try {
		id = Integer.parseInt(strId);
		rootid = Integer.parseInt(strRootid);
		isleaf = Integer.parseInt(strIsleaf);
	} catch (NumberFormatException e) {
		out.println("数字格式有误!");
		return;
	}
	//检查表单数据title,cont
	if(EX.checkStr(title) || EX.checkStr(cont)) {
		out.println("标题或者内容不能为空！");
		return;
	}
	
	//链接数据库，并创建一个事务
	Connection conn = DB.getConn();
	conn.setAutoCommit(false);
	
	//1.向数据库插入一条记录
	String sql = "insert into article values (null, ?, ?, ?, ?, now(), 0)";
	PreparedStatement preStmt = DB.getPreStmt(conn, sql);
	preStmt.setInt(1, id);
	preStmt.setInt(2, rootid);
	preStmt.setString(3, title);
	preStmt.setString(4, cont);
	preStmt.executeUpdate();
	
	//2.修改id的isleaf
	Statement stmt = null;
	if(isleaf == 0) {
		stmt = DB.getStmt(conn);
		String upSql = "update article set isleaf = 1 where id = " + id;
		stmt.executeUpdate(upSql);
	}
	
	//3.事务结束，恢复现场
	conn.commit();
	conn.setAutoCommit(true);
	
	//4.关闭与数据库之间的连接
	DB.close(preStmt);
	DB.close(stmt);
	DB.close(conn);
	
	//返回初始页
	response.sendRedirect("article.jsp");
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>reply</title>
    
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
		回复帖子
	</div>
	<form action="reply.jsp" method="post">
		<input type="hidden" name="method" value="post">
		<input type="hidden" name="id" value="<%= request.getParameter("id")%>">
		<input type="hidden" name="rootid" value="<%= request.getParameter("rootid")%>">
		<input type="hidden" name="isleaf" value="<%= request.getParameter("isleaf")%>">
		<div style="height: 100px;width: 70px;float: left;padding-left: 30px">
			标题:
		</div>
		<div style="height: 100px;width: 1070px;float: left">
			<input type="text" name="title" style="width: inherit">
		</div>
		<div style="height: 400px;width: 70px;float: left;padding-left: 30px">
			内容:
		</div>
		<div style="height: 400px;width: 1070px;float: left">
			<textarea rows="20" name="cont" style="width: inherit"></textarea>
		</div>
		<div style="height: 100px;width: 70px;float: left;padding-left: 30px">
			<input type="submit" value="提交">
		</div>
	</form>
</div>
  </body>
</html>

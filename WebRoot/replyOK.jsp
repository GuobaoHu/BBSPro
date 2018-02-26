<%@ page language="java" import="java.util.*,guyue.BBS.*,java.sql.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
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

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Reply Finish</title>
    
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
	
	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    回复完成,<span id="time" background="yellow">6</span>秒之后进行跳转
    <br>
    如未跳转，点击<a href="article.jsp">这里</a>
    <script type="text/javascript">
    	delayURL("article.jsp");
    </script>
  </body>
</html>

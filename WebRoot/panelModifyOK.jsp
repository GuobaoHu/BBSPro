<%@ page language="java" import="java.util.*,guyue.BBS.*,java.sql.*" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String title = request.getParameter("title");
String cont = request.getParameter("cont");
int id = Integer.parseInt(request.getParameter("id"));
String fromUrl = request.getParameter("from");
/* System.out.println(title + "     " + cont);
 */
//检查表单数据title,cont
if(EX.checkStr(title) || EX.checkStr(cont)) {
	out.println("标题或者内容不能为空！");
	return;
}

//链接数据库，并创建一个事务
Connection conn = DB.getConn();

//1.向数据库插入一条记录
String upSql = "update article set title = ? , cont = ? where id = ?";
PreparedStatement preStmt = DB.getPreStmt(conn, upSql);
preStmt.setString(1, title);
preStmt.setString(2, cont);
preStmt.setInt(3, id);
preStmt.executeUpdate();

//4.关闭与数据库之间的连接
DB.close(preStmt);
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
    新话题创建完成,<span id="time" background="yellow">3</span>秒之后进行跳转
    <br>
    如未跳转，点击<a href="<%= fromUrl %>">这里</a>
    <script type="text/javascript">
    	delayURL("<%= fromUrl %>");
    </script>
  </body>
</html>

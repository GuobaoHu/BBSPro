<%@ page language="java" import="java.util.*, java.sql.*, guyue.BBS.*" pageEncoding="UTF-8"%>
<%!
private void delete(Connection conn, int id) {
	String sql = "select * from article where pid = " + id;
	Statement stmt = DB.getStmt(conn);
	ResultSet rs = DB.getRs(stmt, sql);
	try {
		while(rs.next()) {
			delete(conn, rs.getInt("id"));
		}
		DB.executeUpdate(conn, "delete from article where id = " + id);
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		DB.close(rs);
		DB.close(stmt);
	}
}
%>

<%
request.setCharacterEncoding("utf-8");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

//创建一个事务
Connection conn = DB.getConn();
conn.setAutoCommit(false);

int id = Integer.parseInt(request.getParameter("id"));
int pid = Integer.parseInt(request.getParameter("pid"));

//删除id及id的子帖
delete(conn, id);

//修改pid的isleaf
String sql = "select count(*) from article where pid = " + pid;
Statement stmt = DB.getStmt(conn);
ResultSet rs = DB.getRs(stmt, sql);
rs.next();
int count = rs.getInt(1);
DB.close(rs);
DB.close(stmt);

if(count == 0) {
	String delSql = "update article set isleaf = 0 where id = " + pid;
	DB.executeUpdate(conn, delSql);
}

//恢复现场
conn.commit();
conn.setAutoCommit(true);

DB.close(conn);

%>
<html>
<head>
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
    如未跳转，点击<a href="article.jsp">这里</a>
    <script type="text/javascript">
    	delayURL("article.jsp");
    </script>
</body>
</html>
	
 
   
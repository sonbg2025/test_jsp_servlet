<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String uid = "scott";
	String password = "tiger";
	String sql = "select * from emp";
%>    
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table width="800" border="1">
		<tr>
			<th>사원번호</th>
			<th>사원명</th>
			<th>직급</th>
			<th>상관번호</th>
			<th>입사일자</th>
			<th>급여</th>
			<th>커미션</th>
			<th>부서번호</th>
		</tr>
		<%
			try{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				conn = DriverManager.getConnection(url, uid, password);
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				
				while(rs.next()){
					out.println("<tr>");
					out.println("<td>"+rs.getString("empno")+"</td>");
					out.println("<td>"+rs.getString("ename")+"</td>");
					out.println("<td>"+rs.getString("job")+"</td>");
					out.println("<td>"+rs.getString("mgr")+"</td>");
					out.println("<td>"+rs.getString("hiredate")+"</td>");
					out.println("<td>"+rs.getInt("sal")+"</td>");
					out.println("<td>"+rs.getInt("comm")+"</td>");
					out.println("<td>"+rs.getInt("deptno")+"</td>");
					out.println("</tr>");
				}
			} catch(Exception e) {
				e.printStackTrace();
			}finally{
				try{
					if(rs != null)
						rs.close();
					if(stmt != null)
						stmt.close();
					if(conn != null)
						conn.close();
				} catch(Exception e) {
					e.printStackTrace();
				}
			}
				
		%>
	</table>
</body>
</html>
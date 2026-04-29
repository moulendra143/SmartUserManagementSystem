<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Database Test</title>
</head>
<body>
    <h2>Testing Database Connection...</h2>
    <%
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/smart_user_db", "root", "root");
            if (conn != null) {
                out.println("<p style='color:green;'>Connection Successful!</p>");
                conn.close();
            }
        } catch (Exception e) {
            out.println("<p style='color:red;'>Connection Failed: " + e.getMessage() + "</p>");
            e.printStackTrace();
        }
    %>
</body>
</html>

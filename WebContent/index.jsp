<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.app.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("jsp/auth/login.jsp");
    } else if ("ADMIN".equals(user.getRole())) {
        response.sendRedirect("admin-dashboard");
    } else {
        response.sendRedirect("jsp/user/dashboard.jsp");
    }
%>

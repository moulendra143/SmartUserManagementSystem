<%@ page import="com.app.model.User" %>
<%
    User currentUser = (User) session.getAttribute("user");
%>
<nav class="navbar">
    <a href="${pageContext.request.contextPath}/index.jsp" class="nav-logo">
        <i class="fas fa-users-cog"></i> SmartUser
    </a>
    
    <div class="nav-links">
        <% if (currentUser != null) { %>
            <a href="${pageContext.request.contextPath}/<%= "ADMIN".equals(currentUser.getRole()) ? "admin-dashboard" : "jsp/user/dashboard.jsp" %>">
                Dashboard
            </a>
            <% if ("ADMIN".equals(currentUser.getRole())) { %>
                <a href="${pageContext.request.contextPath}/user-management?action=list">Users</a>
                <a href="${pageContext.request.contextPath}/jsp/reports/analytics.jsp">Analytics</a>
            <% } %>
            
            <span style="color: var(--border); margin: 0 0.5rem;">|</span>
            
            <div style="display: flex; align-items: center; gap: 1rem;">
                <span style="font-size: 0.9rem; font-weight: 600;"><%= currentUser.getFullName() %></span>
                <a href="${pageContext.request.contextPath}/logout" class="btn btn-danger" style="padding: 0.4rem 0.8rem; font-size: 0.85rem;">
                    Logout
                </a>
            </div>
        <% } else { %>
            <a href="${pageContext.request.contextPath}/jsp/auth/login.jsp">Login</a>
            <a href="${pageContext.request.contextPath}/jsp/auth/register.jsp" class="btn btn-primary">Sign Up</a>
        <% } %>
    </div>
</nav>

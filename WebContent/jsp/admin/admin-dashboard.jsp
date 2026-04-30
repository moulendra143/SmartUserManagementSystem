<%@ include file="../common/header.jsp" %>
<%@ include file="../common/navbar.jsp" %>
<%@ page import="com.app.dao.UserDao" %>

<%
    int totalUsers = (Integer) request.getAttribute("totalUsers");
    int adminCount = (Integer) request.getAttribute("adminCount");
    int userCount = (Integer) request.getAttribute("userCount");
%>

<div style="margin-bottom: 2.5rem;">
    <h1>Admin Dashboard</h1>
    <p style="color: var(--text-muted);">System overview and administrative controls.</p>
</div>

<div class="stats-grid">
    <div class="stat-card">
        <div class="stat-label">Total Users</div>
        <div class="stat-value"><%= totalUsers %></div>
        <div style="margin-top: 1rem; font-size: 0.8rem; color: var(--success);"><i class="fas fa-arrow-up"></i> 12% increase</div>
    </div>
    <div class="stat-card">
        <div class="stat-label">Administrators</div>
        <div class="stat-value"><%= adminCount %></div>
        <div style="margin-top: 1rem; font-size: 0.8rem; color: var(--text-muted);">Privileged access</div>
    </div>
    <div class="stat-card">
        <div class="stat-label">Standard Users</div>
        <div class="stat-value"><%= userCount %></div>
        <div style="margin-top: 1rem; font-size: 0.8rem; color: var(--text-muted);">Active members</div>
    </div>
</div>

<div style="display: grid; grid-template-columns: 2fr 1fr; gap: 2rem;">
    <div class="card">
        <h3 style="margin-bottom: 1.5rem;">Quick Actions</h3>
        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem;">
            <a href="${pageContext.request.contextPath}/user-management?action=list" class="btn btn-outline" style="flex-direction: column; padding: 2rem; gap: 1rem;">
                <i class="fas fa-users" style="font-size: 2rem; color: var(--primary);"></i>
                Manage Users
            </a>
            <a href="${pageContext.request.contextPath}/jsp/reports/analytics.jsp" class="btn btn-outline" style="flex-direction: column; padding: 2rem; gap: 1rem;">
                <i class="fas fa-chart-line" style="font-size: 2rem; color: var(--success);"></i>
                View Analytics
            </a>
        </div>
    </div>

    <div class="card">
        <h3 style="margin-bottom: 1.5rem;">System Status</h3>
        <div style="display: flex; flex-direction: column; gap: 1rem;">
            <div style="display: flex; justify-content: space-between; align-items: center;">
                <span style="font-size: 0.9rem;">Database Connection</span>
                <span class="badge" style="background: #f0fdf4; color: #15803d;">Stable</span>
            </div>
            <div style="display: flex; justify-content: space-between; align-items: center;">
                <span style="font-size: 0.9rem;">File System</span>
                <span class="badge" style="background: #f0fdf4; color: #15803d;">Healthy</span>
            </div>
            <div style="display: flex; justify-content: space-between; align-items: center;">
                <span style="font-size: 0.9rem;">API Response</span>
                <span class="badge" style="background: #f0fdf4; color: #15803d;">24ms</span>
            </div>
        </div>
    </div>
</div>

<%@ include file="../common/footer.jsp" %>

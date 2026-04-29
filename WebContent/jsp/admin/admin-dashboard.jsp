<%@ include file="../common/header.jsp" %>
<%@ include file="../common/navbar.jsp" %>

<div class="container">
    <div style="margin-bottom: 2.5rem;">
        <h1>Admin Dashboard</h1>
        <p style="color: var(--text-muted);">Overview of system population and performance.</p>
    </div>

    <div class="stats-grid">
        <div class="stat-card">
            <span class="stat-label">Total Users</span>
            <span class="stat-value">${totalUsers}</span>
        </div>
        <div class="stat-card">
            <span class="stat-label">Administrators</span>
            <span class="stat-value">${adminCount}</span>
        </div>
        <div class="stat-card">
            <span class="stat-label">Standard Users</span>
            <span class="stat-value">${userCount}</span>
        </div>
    </div>

    <div style="display: grid; grid-template-columns: 2fr 1fr; gap: 2rem;">
        <div class="card">
            <h3>Quick Actions</h3>
            <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem; margin-top: 1.5rem;">
                <a href="user-management?action=list" class="btn btn-primary">
                    <i class="fas fa-users"></i> Manage Users
                </a>
                <a href="${pageContext.request.contextPath}/jsp/reports/analytics.jsp" class="btn btn-outline">
                    <i class="fas fa-chart-pie"></i> View Analytics
                </a>
            </div>
        </div>
        <div class="card">
            <h3>System Status</h3>
            <div style="margin-top: 1.5rem;">
                <div style="display: flex; justify-content: space-between; margin-bottom: 0.75rem;">
                    <span style="color: var(--text-muted);">Database</span>
                    <span style="color: var(--success); font-weight: 600;">CONNECTED</span>
                </div>
                <div style="display: flex; justify-content: space-between;">
                    <span style="color: var(--text-muted);">Server</span>
                    <span style="color: var(--success); font-weight: 600;">STABLE</span>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="../common/footer.jsp" %>

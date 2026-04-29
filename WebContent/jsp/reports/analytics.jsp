<%@ include file="../common/header.jsp" %>
<%@ include file="../common/navbar.jsp" %>
<%@ page import="com.app.dao.UserDao" %>

<div class="container">
    <div style="margin-bottom: 2.5rem;">
        <h1>System Analytics</h1>
        <p style="color: var(--text-muted);">Real-time metrics and population distribution.</p>
    </div>
    
    <%
        UserDao dao = new UserDao();
        int total = dao.getTotalUserCount(null, null);
        int admins = dao.getTotalUserCount(null, "ADMIN");
        int users = dao.getTotalUserCount(null, "USER");
        
        double adminPct = (total > 0) ? (double)admins / total * 100 : 0;
        double userPct = (total > 0) ? (double)users / total * 100 : 0;
    %>

    <div class="stats-grid">
        <div class="stat-card">
            <span class="stat-label">Total Population</span>
            <span class="stat-value"><%= total %></span>
        </div>
        <div class="stat-card">
            <span class="stat-label">Admin Ratio</span>
            <span class="stat-value"><%= (int)adminPct %>%</span>
        </div>
        <div class="stat-card">
            <span class="stat-label">User Ratio</span>
            <span class="stat-value"><%= (int)userPct %>%</span>
        </div>
    </div>
    
    <div class="card">
        <h3>Distribution Overview</h3>
        <div style="margin-top: 2rem;">
            <div style="margin-bottom: 1.5rem;">
                <div style="display: flex; justify-content: space-between; margin-bottom: 0.5rem; font-size: 0.9rem;">
                    <span>Administrators</span>
                    <span style="font-weight: 600;"><%= admins %> Users</span>
                </div>
                <div style="height: 12px; background: #f1f5f9; border-radius: 6px; overflow: hidden;">
                    <div style="width: <%= adminPct %>%; height: 100%; background: var(--primary);"></div>
                </div>
            </div>
            
            <div>
                <div style="display: flex; justify-content: space-between; margin-bottom: 0.5rem; font-size: 0.9rem;">
                    <span>Standard Users</span>
                    <span style="font-weight: 600;"><%= users %> Users</span>
                </div>
                <div style="height: 12px; background: #f1f5f9; border-radius: 6px; overflow: hidden;">
                    <div style="width: <%= userPct %>%; height: 100%; background: #94a3b8;"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="../common/footer.jsp" %>

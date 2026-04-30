<%@ page import="com.app.dao.UserDao" %>
<%
    UserDao dao = new UserDao();
    int adminCount = dao.getTotalUserCount(null, "ADMIN");
    int userCount = dao.getTotalUserCount(null, "USER");
    int totalUsers = adminCount + userCount;
%>

<%@ include file="../common/header.jsp" %>
<%@ include file="../common/navbar.jsp" %>

<!-- Chart.js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<div style="margin-bottom: 2.5rem;">
    <h1>System Analytics</h1>
    <p style="color: var(--text-muted);">Real-time performance and user distribution metrics.</p>
</div>

<div class="stats-grid">
    <div class="stat-card">
        <div class="stat-label">Active Users</div>
        <div class="stat-value"><%= totalUsers %></div>
        <div style="margin-top: 1rem; font-size: 0.8rem; color: var(--success);"><i class="fas fa-users"></i> Registered</div>
    </div>
    <div class="stat-card">
        <div class="stat-label">Administrators</div>
        <div class="stat-value"><%= adminCount %></div>
        <div style="margin-top: 1rem; font-size: 0.8rem; color: var(--primary);"><i class="fas fa-user-shield"></i> Privileged</div>
    </div>
    <div class="stat-card">
        <div class="stat-label">Standard Users</div>
        <div class="stat-value"><%= userCount %></div>
        <div style="margin-top: 1rem; font-size: 0.8rem; color: var(--text-muted);"><i class="fas fa-user"></i> Basic access</div>
    </div>
</div>

<div style="display: grid; grid-template-columns: 1fr 1fr; gap: 2rem;">
    <div class="card">
        <h3 style="margin-bottom: 2rem;"><i class="fas fa-chart-pie" style="margin-right: 10px; color: var(--primary);"></i> User Distribution</h3>
        <div style="height: 300px; position: relative;">
            <canvas id="userDistChart"></canvas>
        </div>
    </div>

    <div class="card">
        <h3 style="margin-bottom: 2rem;"><i class="fas fa-history" style="margin-right: 10px; color: var(--success);"></i> System Health</h3>
        <div style="display: flex; flex-direction: column; gap: 1.5rem;">
            <div>
                <div style="display: flex; justify-content: space-between; margin-bottom: 0.5rem; font-size: 0.9rem;">
                    <span>CPU Usage</span>
                    <span>12%</span>
                </div>
                <div style="height: 8px; background: #e2e8f0; border-radius: 4px; overflow: hidden;">
                    <div style="width: 12%; height: 100%; background: var(--primary);"></div>
                </div>
            </div>
            <div>
                <div style="display: flex; justify-content: space-between; margin-bottom: 0.5rem; font-size: 0.9rem;">
                    <span>Memory Usage</span>
                    <span>45%</span>
                </div>
                <div style="height: 8px; background: #e2e8f0; border-radius: 4px; overflow: hidden;">
                    <div style="width: 45%; height: 100%; background: var(--success);"></div>
                </div>
            </div>
            <div>
                <div style="display: flex; justify-content: space-between; margin-bottom: 0.5rem; font-size: 0.9rem;">
                    <span>Storage (Uploads)</span>
                    <span>8%</span>
                </div>
                <div style="height: 8px; background: #e2e8f0; border-radius: 4px; overflow: hidden;">
                    <div style="width: 8%; height: 100%; background: #f59e0b;"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
    const ctx = document.getElementById('userDistChart').getContext('2d');
    new Chart(ctx, {
        type: 'doughnut',
        data: {
            labels: ['Admins', 'Standard Users'],
            datasets: [{
                data: [<%= adminCount %>, <%= userCount %>],
                backgroundColor: ['#2563eb', '#64748b'],
                borderWidth: 0,
                hoverOffset: 10
            }]
        },
        options: {
            maintainAspectRatio: false,
            plugins: {
                legend: {
                    position: 'bottom',
                    labels: {
                        padding: 20,
                        usePointStyle: true,
                        font: { family: 'Inter', size: 12 }
                    }
                }
            },
            cutout: '70%'
        }
    });
});
</script>

<%@ include file="../common/footer.jsp" %>

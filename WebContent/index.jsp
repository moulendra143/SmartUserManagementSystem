<%@ include file="jsp/common/header.jsp" %>
<%@ include file="jsp/common/navbar.jsp" %>

<div style="text-align: center; padding: 4rem 0;">
    <h1 style="font-size: 3.5rem; margin-bottom: 1.5rem;">Manage Your Team <span style="color: var(--primary);">Smarter</span></h1>
    <p style="font-size: 1.25rem; color: var(--text-muted); max-width: 700px; margin: 0 auto 2.5rem;">
        The all-in-one platform for enterprise user management, analytics, and secure profile handling.
    </p>
    <div style="display: flex; gap: 1rem; justify-content: center;">
        <a href="jsp/auth/register.jsp" class="btn btn-primary" style="padding: 1rem 2rem;">Get Started for Free</a>
        <a href="jsp/auth/login.jsp" class="btn btn-outline" style="padding: 1rem 2rem;">Login to Dashboard</a>
    </div>
</div>

<div class="stats-grid">
    <div class="stat-card">
        <div class="stat-label">Security</div>
        <div class="stat-value">Enterprise Grade</div>
    </div>
    <div class="stat-card">
        <div class="stat-label">Uptime</div>
        <div class="stat-value">99.9%</div>
    </div>
    <div class="stat-card">
        <div class="stat-label">Integrations</div>
        <div class="stat-value">REST Ready</div>
    </div>
</div>

<%@ include file="jsp/common/footer.jsp" %>

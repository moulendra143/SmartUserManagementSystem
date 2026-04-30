<%@ include file="../common/header.jsp" %>
<%@ include file="../common/navbar.jsp" %>

<div class="auth-page">
    <div class="card auth-card">
        <div style="text-align: center; margin-bottom: 2rem;">
            <div style="width: 60px; height: 60px; background: #eff6ff; color: var(--primary); border-radius: 12px; display: flex; align-items: center; justify-content: center; margin: 0 auto 1rem; font-size: 1.5rem;">
                <i class="fas fa-lock"></i>
            </div>
            <h2>Welcome Back</h2>
            <p style="color: var(--text-muted);">Sign in to your account to continue</p>
        </div>

        <% if (request.getAttribute("error") != null) { %>
            <div class="alert alert-error">
                <i class="fas fa-exclamation-circle"></i> <%= request.getAttribute("error") %>
            </div>
        <% } %>
        <% if (request.getParameter("msg") != null) { %>
            <div class="alert alert-success">
                <i class="fas fa-circle-check"></i> <%= request.getParameter("msg") %>
            </div>
        <% } %>

        <form action="${pageContext.request.contextPath}/login" method="post">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" placeholder="Enter your username" required autofocus>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="••••••••" required>
            </div>
            <button type="submit" class="btn btn-primary" style="width: 100%; margin-top: 1rem;">Login</button>
        </form>

        <div style="text-align: center; margin-top: 1.5rem; font-size: 0.9rem; color: var(--text-muted);">
            Don't have an account? <a href="register.jsp" style="color: var(--primary); font-weight: 600; text-decoration: none;">Create one</a>
        </div>
    </div>
</div>

<%@ include file="../common/footer.jsp" %>

<%@ include file="../common/header.jsp" %>
<%@ include file="../common/navbar.jsp" %>

<div class="auth-page">
    <div class="card auth-card">
        <h2 class="text-center">Welcome Back</h2>
        <p class="text-center" style="color: var(--text-muted); margin-bottom: 2rem;">Please enter your details to login</p>
        
        <% if (request.getAttribute("error") != null) { %>
            <div class="alert alert-error">
                <i class="fas fa-exclamation-circle"></i>
                <%= request.getAttribute("error") %>
            </div>
        <% } %>
        <% if (request.getParameter("msg") != null) { %>
            <div class="alert alert-success">
                <i class="fas fa-check-circle"></i>
                <%= request.getParameter("msg") %>
            </div>
        <% } %>

        <form action="${pageContext.request.contextPath}/login" method="post">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" placeholder="Enter username" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="••••••••" required>
            </div>
            
            <button type="submit" class="btn btn-primary" style="width: 100%; margin-top: 1rem;">
                Sign In
            </button>
        </form>
        
        <p class="text-center" style="margin-top: 2rem; font-size: 0.9rem; color: var(--text-muted);">
            Don't have an account? <a href="register.jsp" style="color: var(--primary); font-weight: 600; text-decoration: none;">Create one</a>
        </p>
    </div>
</div>

<%@ include file="../common/footer.jsp" %>

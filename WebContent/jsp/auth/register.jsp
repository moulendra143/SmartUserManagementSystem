<%@ include file="../common/header.jsp" %>
<%@ include file="../common/navbar.jsp" %>

<div class="auth-page">
    <div class="card auth-card">
        <h2 class="text-center">Create Account</h2>
        <p class="text-center" style="color: var(--text-muted); margin-bottom: 2rem;">Join our management system</p>
        
        <% if (request.getAttribute("error") != null) { %>
            <div class="alert alert-error">
                <i class="fas fa-exclamation-circle"></i>
                <%= request.getAttribute("error") %>
            </div>
        <% } %>

        <form action="${pageContext.request.contextPath}/register" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="fullName">Full Name</label>
                <input type="text" id="fullName" name="fullName" placeholder="John Doe" required>
            </div>
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" placeholder="johndoe" required>
            </div>
            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" id="email" name="email" placeholder="john@example.com" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="••••••••" required>
            </div>
            <div class="form-group">
                <label for="profileImage">Profile Image</label>
                <input type="file" id="profileImage" name="profileImage">
            </div>
            
            <button type="submit" class="btn btn-primary" style="width: 100%; margin-top: 1rem;">
                Register
            </button>
        </form>
        
        <p class="text-center" style="margin-top: 2rem; font-size: 0.9rem; color: var(--text-muted);">
            Already have an account? <a href="login.jsp" style="color: var(--primary); font-weight: 600; text-decoration: none;">Sign In</a>
        </p>
    </div>
</div>

<%@ include file="../common/footer.jsp" %>

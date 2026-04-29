<%@ include file="../common/header.jsp" %>
<%@ include file="../common/navbar.jsp" %>

<div class="container">
    <div style="margin-bottom: 2.5rem;">
        <h1>User Dashboard</h1>
        <p style="color: var(--text-muted);">Welcome back, ${sessionScope.user.fullName}.</p>
    </div>
    
    <div style="display: grid; grid-template-columns: 300px 1fr; gap: 2rem;">
        <div class="card" style="text-align: center;">
            <div style="width: 120px; height: 120px; background: var(--bg-main); border-radius: 50%; display: flex; align-items: center; justify-content: center; margin: 0 auto 1.5rem; border: 2px solid var(--border);">
                <i class="fas fa-user" style="font-size: 3rem; color: var(--text-muted);"></i>
            </div>
            <h2 style="margin-bottom: 0.5rem;">${sessionScope.user.fullName}</h2>
            <p style="color: var(--primary); font-weight: 600;">@${sessionScope.user.username}</p>
            <div style="margin-top: 1.5rem;">
                <span class="badge badge-user">${sessionScope.user.role}</span>
            </div>
        </div>
        
        <div class="card">
            <h3>Profile Details</h3>
            <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 2rem; margin-top: 1.5rem;">
                <div class="form-group">
                    <label>Username</label>
                    <input type="text" value="${sessionScope.user.username}" readonly>
                </div>
                <div class="form-group">
                    <label>Email Address</label>
                    <input type="text" value="${sessionScope.user.email}" readonly>
                </div>
                <div class="form-group">
                    <label>Full Name</label>
                    <input type="text" value="${sessionScope.user.fullName}" readonly>
                </div>
                <div class="form-group">
                    <label>Member Since</label>
                    <input type="text" value="<%= new java.text.SimpleDateFormat("MMMM dd, yyyy").format(((com.app.model.User)session.getAttribute("user")).getCreatedAt()) %>" readonly>
                </div>
            </div>
            
            <div style="margin-top: 2rem; padding-top: 2rem; border-top: 1px solid var(--border);">
                <button class="btn btn-primary">Edit Profile</button>
                <button class="btn btn-outline" style="margin-left: 1rem;">Change Password</button>
            </div>
        </div>
    </div>
</div>

<%@ include file="../common/footer.jsp" %>

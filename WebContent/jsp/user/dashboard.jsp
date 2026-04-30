<%@ include file="../common/header.jsp" %>
<%@ include file="../common/navbar.jsp" %>

    <% if (request.getParameter("msg") != null) { %>
        <div class="alert alert-success">
            <i class="fas fa-circle-check"></i> <%= request.getParameter("msg") %>
        </div>
    <% } %>
    <% if (request.getParameter("error") != null) { %>
        <div class="alert alert-error">
            <i class="fas fa-exclamation-circle"></i> <%= request.getParameter("error") %>
        </div>
    <% } %>

    <div style="margin-bottom: 2.5rem; display: flex; justify-content: space-between; align-items: flex-end;">
        <div>
            <h1>User Dashboard</h1>
            <p style="color: var(--text-muted);">Welcome back, ${sessionScope.user.fullName}.</p>
        </div>
        <div class="card" style="padding: 1rem; font-size: 0.8rem; background: #f8fafc;">
            <strong>Session ID:</strong> <%= session.getId() %><br>
            <strong>Status:</strong> <span style="color: var(--success);">ACTIVE</span>
        </div>
    </div>
    
    <div style="display: grid; grid-template-columns: 320px 1fr; gap: 2rem;">
        <div class="card" style="text-align: center; height: fit-content;">
            <div style="width: 140px; height: 140px; background: var(--bg-main); border-radius: 20px; display: flex; align-items: center; justify-content: center; margin: 0 auto 1.5rem; border: 2px solid var(--border); overflow: hidden;">
                <% if (currentUser.getProfileImage() != null) { %>
                    <img src="${pageContext.request.contextPath}/<%= currentUser.getProfileImage() %>" style="width: 100%; height: 100%; object-fit: cover;">
                <% } else { %>
                    <i class="fas fa-user" style="font-size: 4rem; color: var(--text-muted);"></i>
                <% } %>
            </div>
            <h2 style="margin-bottom: 0.5rem;"><%= currentUser.getFullName() %></h2>
            <p style="color: var(--primary); font-weight: 600; margin-bottom: 1.5rem;">@<%= currentUser.getUsername() %></p>
            <span class="badge badge-user"><%= currentUser.getRole() %></span>
            
            <div style="margin-top: 2rem; text-align: left; font-size: 0.85rem; color: var(--text-muted);">
                <p><i class="fas fa-calendar-alt" style="margin-right: 8px;"></i> Joined <%= new java.text.SimpleDateFormat("MMM dd, yyyy").format(currentUser.getCreatedAt()) %></p>
            </div>
        </div>
        
        <div style="display: flex; flex-direction: column; gap: 2rem;">
            <!-- Profile Details Form -->
            <div class="card">
                <h3 style="margin-bottom: 1.5rem;"><i class="fas fa-user-edit" style="margin-right: 10px; color: var(--primary);"></i> Edit Profile Details</h3>
                <form action="${pageContext.request.contextPath}/update-profile" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="action" value="updateDetails">
                    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1.5rem;">
                        <div class="form-group">
                            <label>Full Name</label>
                            <input type="text" name="fullName" value="<%= currentUser.getFullName() %>" required>
                        </div>
                        <div class="form-group">
                            <label>Email Address</label>
                            <input type="email" name="email" value="<%= currentUser.getEmail() %>" required>
                        </div>
                        <div class="form-group" style="grid-column: span 2;">
                            <label>Update Profile Image</label>
                            <input type="file" name="profileImage">
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary" style="margin-top: 1rem;">Save Changes</button>
                </form>
            </div>

            <!-- Change Password Form -->
            <div class="card">
                <h3 style="margin-bottom: 1.5rem;"><i class="fas fa-key" style="margin-right: 10px; color: var(--primary);"></i> Security Settings</h3>
                <form action="${pageContext.request.contextPath}/update-profile" method="post">
                    <input type="hidden" name="action" value="changePassword">
                    <div style="display: grid; grid-template-columns: 1fr 1fr 1fr; gap: 1.5rem;">
                        <div class="form-group">
                            <label>Current Password</label>
                            <input type="password" name="currentPassword" required>
                        </div>
                        <div class="form-group">
                            <label>New Password</label>
                            <input type="password" name="newPassword" required>
                        </div>
                        <div class="form-group">
                            <label>Confirm New Password</label>
                            <input type="password" name="confirmPassword" required>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-outline" style="margin-top: 1rem;">Update Password</button>
                </form>
            </div>
        </div>
    </div>
</div>

<%@ include file="../common/footer.jsp" %>

<%@ include file="../common/header.jsp" %>
<%@ include file="../common/navbar.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="com.app.model.User" %>

<%
    List<User> users = (List<User>) request.getAttribute("users");
    int currentPage = (Integer) request.getAttribute("currentPage");
    int totalPages = (Integer) request.getAttribute("totalPages");
    String search = (String) request.getAttribute("search");
    String roleFilter = (String) request.getAttribute("roleFilter");
    User editUser = (User) request.getAttribute("editUser");
%>

<div style="margin-bottom: 2.5rem; display: flex; justify-content: space-between; align-items: center;">
    <div>
        <h1>User Management</h1>
        <p style="color: var(--text-muted);">Manage and monitor all system users.</p>
    </div>
    <div style="display: flex; gap: 1rem;">
        <a href="${pageContext.request.contextPath}/user-management?action=export" class="btn btn-outline">
            <i class="fas fa-file-export"></i> Export CSV
        </a>
    </div>
</div>

<div style="display: grid; grid-template-columns: <%= editUser != null ? "350px 1fr" : "1fr" %>; gap: 2rem;">
    
    <% if (editUser != null) { %>
    <div class="card" style="height: fit-content;">
        <h3 style="margin-bottom: 1.5rem;"><i class="fas fa-user-edit"></i> Edit User</h3>
        <form action="${pageContext.request.contextPath}/user-management" method="post" enctype="multipart/form-data">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="<%= editUser.getId() %>">
            
            <div class="form-group">
                <label>Username</label>
                <input type="text" value="<%= editUser.getUsername() %>" disabled>
            </div>
            <div class="form-group">
                <label>Full Name</label>
                <input type="text" name="fullName" value="<%= editUser.getFullName() %>" required>
            </div>
            <div class="form-group">
                <label>Email</label>
                <input type="email" name="email" value="<%= editUser.getEmail() %>" required>
            </div>
            <div class="form-group">
                <label>Role</label>
                <select name="role">
                    <option value="USER" <%= "USER".equals(editUser.getRole()) ? "selected" : "" %>>USER</option>
                    <option value="ADMIN" <%= "ADMIN".equals(editUser.getRole()) ? "selected" : "" %>>ADMIN</option>
                </select>
            </div>
            <div class="form-group">
                <label>Update Profile Image</label>
                <input type="file" name="profileImage">
            </div>
            <div style="display: flex; gap: 0.5rem; margin-top: 1rem;">
                <button type="submit" class="btn btn-primary" style="flex: 1;">Update</button>
                <a href="${pageContext.request.contextPath}/user-management?action=list" class="btn btn-outline">Cancel</a>
            </div>
        </form>
    </div>
    <% } %>

    <div class="card">
        <!-- Search & Filter -->
        <form action="${pageContext.request.contextPath}/user-management" method="get" style="display: flex; gap: 1rem; margin-bottom: 2rem;">
            <input type="hidden" name="action" value="list">
            <div style="flex: 1; position: relative;">
                <i class="fas fa-search" style="position: absolute; left: 1rem; top: 50%; transform: translateY(-50%); color: var(--text-muted);"></i>
                <input type="text" name="search" placeholder="Search by name, email or username..." value="<%= search != null ? search : "" %>" style="padding-left: 2.5rem;">
            </div>
            <select name="roleFilter" style="width: 150px;">
                <option value="ALL">All Roles</option>
                <option value="USER" <%= "USER".equals(roleFilter) ? "selected" : "" %>>User Only</option>
                <option value="ADMIN" <%= "ADMIN".equals(roleFilter) ? "selected" : "" %>>Admin Only</option>
            </select>
            <button type="submit" class="btn btn-primary">Filter</button>
        </form>

        <div class="table-wrapper">
            <table>
                <thead>
                    <tr>
                        <th>User</th>
                        <th>Email</th>
                        <th>Role</th>
                        <th>Joined</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% if (users != null && !users.isEmpty()) { 
                        for (User u : users) { %>
                        <tr>
                            <td>
                                <div style="display: flex; align-items: center; gap: 1rem;">
                                    <div style="width: 32px; height: 32px; border-radius: 8px; background: #f1f5f9; display: flex; align-items: center; justify-content: center; overflow: hidden; border: 1px solid var(--border);">
                                        <% if (u.getProfileImage() != null) { %>
                                            <img src="${pageContext.request.contextPath}/<%= u.getProfileImage() %>" style="width: 100%; height: 100%; object-fit: cover;">
                                        <% } else { %>
                                            <i class="fas fa-user" style="font-size: 0.8rem; color: var(--text-muted);"></i>
                                        <% } %>
                                    </div>
                                    <div>
                                        <div style="font-weight: 600; font-size: 0.9rem;"><%= u.getFullName() %></div>
                                        <div style="font-size: 0.8rem; color: var(--text-muted);">@<%= u.getUsername() %></div>
                                    </div>
                                </div>
                            </td>
                            <td><%= u.getEmail() %></td>
                            <td>
                                <span class="badge <%= "ADMIN".equals(u.getRole()) ? "badge-admin" : "badge-user" %>">
                                    <%= u.getRole() %>
                                </span>
                            </td>
                            <td><%= new java.text.SimpleDateFormat("MMM dd, yyyy").format(u.getCreatedAt()) %></td>
                            <td>
                                <div style="display: flex; gap: 0.5rem;">
                                    <a href="${pageContext.request.contextPath}/user-management?action=edit&id=<%= u.getId() %>" class="btn btn-outline" style="padding: 0.3rem 0.6rem; font-size: 0.8rem;">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <a href="${pageContext.request.contextPath}/user-management?action=delete&id=<%= u.getId() %>" class="btn btn-danger" style="padding: 0.3rem 0.6rem; font-size: 0.8rem;" onclick="return confirm('Are you sure?')">
                                        <i class="fas fa-trash"></i>
                                    </a>
                                </div>
                            </td>
                        </tr>
                    <% } 
                    } else { %>
                        <tr><td colspan="5" style="text-align: center; padding: 3rem; color: var(--text-muted);">No users found</td></tr>
                    <% } %>
                </tbody>
            </table>
        </div>

        <!-- Pagination -->
        <% if (totalPages > 1) { %>
        <div style="display: flex; justify-content: center; gap: 0.5rem; margin-top: 2rem;">
            <% for (int i = 1; i <= totalPages; i++) { %>
                <a href="${pageContext.request.contextPath}/user-management?action=list&page=<%= i %><%= search != null ? "&search="+search : "" %><%= roleFilter != null ? "&roleFilter="+roleFilter : "" %>" 
                   class="btn <%= i == currentPage ? "btn-primary" : "btn-outline" %>" style="padding: 0.4rem 0.8rem;">
                    <%= i %>
                </a>
            <% } %>
        </div>
        <% } %>
    </div>
</div>

<%@ include file="../common/footer.jsp" %>

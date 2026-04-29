<%@ page import="java.util.List, com.app.model.User" %>
<%@ include file="../common/header.jsp" %>
<%@ include file="../common/navbar.jsp" %>

<div class="container">
    <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 2rem;">
        <div>
            <h1>User Management</h1>
            <p style="color: var(--text-muted);">View and manage system access.</p>
        </div>
        
        <form action="user-management" method="get" style="display: flex; gap: 0.75rem;">
            <input type="hidden" name="action" value="list">
            <input type="text" name="search" class="search-input" placeholder="Search users..." value="${search != null ? search : ''}" style="width: 250px;">
            <select name="roleFilter" style="width: 130px;">
                <option value="ALL" ${roleFilter == 'ALL' ? 'selected' : ''}>All Roles</option>
                <option value="ADMIN" ${roleFilter == 'ADMIN' ? 'selected' : ''}>Admins</option>
                <option value="USER" ${roleFilter == 'USER' ? 'selected' : ''}>Users</option>
            </select>
            <button type="submit" class="btn btn-primary">Filter</button>
            <a href="user-management?action=export" class="btn btn-outline" style="border-color: var(--primary); color: var(--primary);">
                <i class="fas fa-file-export"></i> Export CSV
            </a>
        </form>
    </div>

    <% if (request.getAttribute("editUser") != null) { 
        User u = (User) request.getAttribute("editUser");
    %>
    <div class="card" style="margin-bottom: 2.5rem; border-left: 4px solid var(--primary);">
        <h3 style="margin-bottom: 1.5rem;">Edit User: <%= u.getUsername() %></h3>
        <form action="user-management" method="post" enctype="multipart/form-data" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 1.5rem;">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="<%= u.getId() %>">
            
            <div class="form-group">
                <label>Full Name</label>
                <input type="text" name="fullName" value="<%= u.getFullName() %>" required>
            </div>
            <div class="form-group">
                <label>Email Address</label>
                <input type="email" name="email" value="<%= u.getEmail() %>" required>
            </div>
            <div class="form-group">
                <label>Role</label>
                <select name="role">
                    <option value="USER" <%= "USER".equals(u.getRole()) ? "selected" : "" %>>Standard User</option>
                    <option value="ADMIN" <%= "ADMIN".equals(u.getRole()) ? "selected" : "" %>>Administrator</option>
                </select>
            </div>
            
            <div style="grid-column: 1 / -1; display: flex; gap: 1rem;">
                <button type="submit" class="btn btn-primary">Update User</button>
                <a href="user-management?action=list" class="btn btn-outline">Cancel</a>
            </div>
        </form>
    </div>
    <% } %>

    <div class="table-wrapper">
        <table>
            <thead>
                <tr>
                    <th>Username</th>
                    <th>Full Name</th>
                    <th>Email</th>
                    <th>Role</th>
                    <th>Joined</th>
                    <th style="text-align: right;">Actions</th>
                </tr>
            </thead>
            <tbody>
                <% 
                List<User> users = (List<User>) request.getAttribute("users");
                if (users != null && !users.isEmpty()) {
                    for (User u : users) {
                %>
                <tr>
                    <td><strong><%= u.getUsername() %></strong></td>
                    <td><%= u.getFullName() %></td>
                    <td><%= u.getEmail() %></td>
                    <td>
                        <span class="badge <%= "ADMIN".equals(u.getRole()) ? "badge-admin" : "badge-user" %>">
                            <%= u.getRole() %>
                        </span>
                    </td>
                    <td><%= new java.text.SimpleDateFormat("MMM dd, yyyy").format(u.getCreatedAt()) %></td>
                    <td style="text-align: right;">
                        <a href="user-management?action=edit&id=<%= u.getId() %>" class="btn btn-outline" style="padding: 0.4rem 0.6rem;">
                            <i class="fas fa-edit"></i>
                        </a>
                        <a href="user-management?action=delete&id=<%= u.getId() %>" class="btn btn-danger" style="padding: 0.4rem 0.6rem;" onclick="return confirm('Delete this user?')">
                            <i class="fas fa-trash"></i>
                        </a>
                    </td>
                </tr>
                <% 
                    }
                } else {
                %>
                <tr><td colspan="6" class="text-center" style="padding: 3rem; color: var(--text-muted);">No users found.</td></tr>
                <% } %>
            </tbody>
        </table>
    </div>
</div>

<%@ include file="../common/footer.jsp" %>

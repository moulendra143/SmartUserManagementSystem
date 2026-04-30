package com.app.controller;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.util.List;
import com.app.dao.UserDao;
import com.app.model.User;

import com.app.util.FileUtil;

public class UserServlet extends HttpServlet {
    
    private UserDao userDao = new UserDao();

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "list":
                listUsers(req, res);
                break;
            case "delete":
                deleteUser(req, res);
                break;
            case "edit":
                showEditForm(req, res);
                break;
            case "export":
                exportToCSV(req, res);
                break;
            default:
                listUsers(req, res);
        }
    }

    private void exportToCSV(HttpServletRequest req, HttpServletResponse res) throws IOException {
        res.setContentType("text/csv");
        res.setHeader("Content-Disposition", "attachment; filename=users_export.csv");

        List<User> users = userDao.getAllUsers(0, 1000, null, null); // Get up to 1000 users
        java.io.PrintWriter writer = res.getWriter();
        writer.println("ID,Username,Email,FullName,Role,CreatedAt");

        for (User u : users) {
            writer.printf("%d,%s,%s,%s,%s,%s\n", 
                u.getId(), u.getUsername(), u.getEmail(), 
                u.getFullName(), u.getRole(), u.getCreatedAt());
        }
        writer.flush();
        writer.close();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String action = req.getParameter("action");
        if ("update".equals(action)) {
            updateUser(req, res);
        }
    }

    private void listUsers(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        int page = 1;
        int limit = 5;
        if (req.getParameter("page") != null) page = Integer.parseInt(req.getParameter("page"));
        
        String search = req.getParameter("search");
        String roleFilter = req.getParameter("roleFilter");

        int offset = (page - 1) * limit;
        List<User> users = userDao.getAllUsers(offset, limit, search, roleFilter);
        int totalUsers = userDao.getTotalUserCount(search, roleFilter);
        int totalPages = (int) Math.ceil((double) totalUsers / limit);

        req.setAttribute("users", users);
        req.setAttribute("currentPage", page);
        req.setAttribute("totalPages", totalPages);
        req.setAttribute("search", search);
        req.setAttribute("roleFilter", roleFilter);

        req.getRequestDispatcher("jsp/admin/manage-users.jsp").forward(req, res);
    }

    private void deleteUser(HttpServletRequest req, HttpServletResponse res) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        userDao.deleteUser(id);
        res.sendRedirect("user-management?action=list");
    }

    private void showEditForm(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        User user = userDao.getUserById(id);
        req.setAttribute("editUser", user);
        
        // Also populate the list so the table is still visible
        listUsers(req, res);
    }


    private void updateUser(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String email = req.getParameter("email");
        String fullName = req.getParameter("fullName");
        String role = req.getParameter("role");

        User user = userDao.getUserById(id);
        user.setEmail(email);
        user.setFullName(fullName);
        user.setRole(role);

        // Handle Image Upload using FileUtil
        Part filePart = req.getPart("profileImage");
        if (filePart != null && filePart.getSize() > 0) {
            String uploadPath = getServletContext().getRealPath("/uploads");
            String filePath = FileUtil.saveFile(filePart, uploadPath);
            if (filePath != null) {
                user.setProfileImage(filePath);
            }
        }


        userDao.updateUser(user);
        res.sendRedirect("user-management?action=list");
    }
}

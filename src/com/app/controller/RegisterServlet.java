package com.app.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import com.app.dao.UserDao;
import com.app.model.User;

import com.app.util.FileUtil;

public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws IOException, ServletException {

        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String pass = req.getParameter("password");
        String fullName = req.getParameter("fullName");

        StringBuilder errorMsg = new StringBuilder();
        if (username == null || username.trim().isEmpty()) errorMsg.append("Username is required. ");
        if (email == null || !email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) errorMsg.append("Invalid email format. ");
        if (pass == null || pass.length() < 6) errorMsg.append("Password must be at least 6 characters. ");
        if (fullName == null || fullName.trim().isEmpty()) errorMsg.append("Full Name is required. ");

        if (errorMsg.length() > 0) {
            req.setAttribute("error", errorMsg.toString());
            req.getRequestDispatcher("jsp/auth/register.jsp").forward(req, res);
            return;
        }

        User u = new User();
        u.setUsername(username.trim());
        u.setEmail(email.trim());
        u.setPassword(pass);
        u.setFullName(fullName.trim());
        u.setRole("USER");

        // Handle Image Upload using FileUtil
        Part filePart = req.getPart("profileImage");
        if (filePart != null && filePart.getSize() > 0) {
            String uploadPath = getServletContext().getRealPath("/uploads");
            String filePath = FileUtil.saveFile(filePart, uploadPath);
            if (filePath != null) {
                u.setProfileImage(filePath);
            }
        }

        UserDao dao = new UserDao();
        if (dao.register(u)) {
            res.sendRedirect("jsp/auth/login.jsp?msg=Registration successful. Please login.");
        } else {
            req.setAttribute("error", "Registration failed. Username or Email already exists.");
            req.getRequestDispatcher("jsp/auth/register.jsp").forward(req, res);
        }
    }
}
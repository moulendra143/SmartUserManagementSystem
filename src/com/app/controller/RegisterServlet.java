package com.app.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import com.app.dao.UserDao;
import com.app.model.User;

@WebServlet("/register")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
                 maxFileSize = 1024 * 1024 * 10,
                 maxRequestSize = 1024 * 1024 * 50)
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

        // Handle Image Upload
        try {
            javax.servlet.http.Part filePart = req.getPart("profileImage");
            if (filePart != null && filePart.getSize() > 0) {
                String fileName = "reg_" + System.currentTimeMillis() + "_" + username.trim() + ".jpg";
                String uploadPath = getServletContext().getRealPath("/uploads");
                java.io.File uploadDir = new java.io.File(uploadPath);
                if (!uploadDir.exists()) uploadDir.mkdirs();
                filePart.write(uploadPath + java.io.File.separator + fileName);
                u.setProfileImage("uploads/" + fileName);
            }
        } catch (Exception e) {
            // Ignore upload errors for now
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
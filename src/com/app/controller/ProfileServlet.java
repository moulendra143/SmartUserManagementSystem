package com.app.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.app.dao.UserDao;
import com.app.model.User;
import com.app.util.FileUtil;

public class ProfileServlet extends HttpServlet {
    private UserDao userDao = new UserDao();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("user");

        if (currentUser == null) {
            response.sendRedirect(request.getContextPath() + "/jsp/auth/login.jsp");
            return;
        }

        if ("updateDetails".equals(action)) {
            updateDetails(request, response, currentUser);
        } else if ("changePassword".equals(action)) {
            changePassword(request, response, currentUser);
        }
    }

    private void updateDetails(HttpServletRequest request, HttpServletResponse response, User currentUser) throws ServletException, IOException {
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        Part filePart = request.getPart("profileImage");

        currentUser.setFullName(fullName);
        currentUser.setEmail(email);

        if (filePart != null && filePart.getSize() > 0) {
            String uploadPath = getServletContext().getRealPath("/uploads");
            String filePath = FileUtil.saveFile(filePart, uploadPath);
            if (filePath != null) {
                currentUser.setProfileImage(filePath);
            }
        }

        if (userDao.updateUser(currentUser)) {
            request.getSession().setAttribute("user", currentUser);
            response.sendRedirect(request.getContextPath() + "/jsp/user/dashboard.jsp?msg=Profile updated successfully");
        } else {
            response.sendRedirect(request.getContextPath() + "/jsp/user/dashboard.jsp?error=Failed to update profile");
        }
    }

    private void changePassword(HttpServletRequest request, HttpServletResponse response, User currentUser) throws ServletException, IOException {
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        if (!currentUser.getPassword().equals(currentPassword)) {
            response.sendRedirect(request.getContextPath() + "/jsp/user/dashboard.jsp?error=Incorrect current password");
            return;
        }

        if (!newPassword.equals(confirmPassword)) {
            response.sendRedirect(request.getContextPath() + "/jsp/user/dashboard.jsp?error=Passwords do not match");
            return;
        }

        if (userDao.updatePassword(currentUser.getId(), newPassword)) {
            currentUser.setPassword(newPassword);
            request.getSession().setAttribute("user", currentUser);
            response.sendRedirect(request.getContextPath() + "/jsp/user/dashboard.jsp?msg=Password updated successfully");
        } else {
            response.sendRedirect(request.getContextPath() + "/jsp/user/dashboard.jsp?error=Failed to update password");
        }
    }
}

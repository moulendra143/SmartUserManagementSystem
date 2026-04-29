package com.app.controller;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import com.app.dao.UserDao;

@WebServlet("/admin-dashboard")
public class AdminServlet extends HttpServlet {
    private UserDao userDao = new UserDao();

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        int totalUsers = userDao.getTotalUserCount(null, null);
        int adminCount = userDao.getTotalUserCount(null, "ADMIN");
        int userCount = userDao.getTotalUserCount(null, "USER");

        req.setAttribute("totalUsers", totalUsers);
        req.setAttribute("adminCount", adminCount);
        req.setAttribute("userCount", userCount);

        req.getRequestDispatcher("jsp/admin/admin-dashboard.jsp").forward(req, res);
    }
}

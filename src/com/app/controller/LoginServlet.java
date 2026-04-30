package com.app.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import com.app.dao.UserDao;
import com.app.model.User;

public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws IOException, ServletException {

        String userParam = req.getParameter("username");
        String pass = req.getParameter("password");

        UserDao dao = new UserDao();
        User user = dao.login(userParam, pass);

        if (user != null) {
            HttpSession session = req.getSession();
            session.setAttribute("user", user);

            if ("ADMIN".equals(user.getRole())) {
                res.sendRedirect("admin-dashboard?loginSuccess=true");
            } else {
                res.sendRedirect("jsp/user/dashboard.jsp?loginSuccess=true");
            }
        } else {
            req.setAttribute("error", "Invalid username or password");
            req.getRequestDispatcher("jsp/auth/login.jsp").forward(req, res);
        }
    }
}
package com.app.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AuthFilter implements Filter {

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);
        String path = req.getRequestURI().substring(req.getContextPath().length());

        // Define public pages
        boolean isPublicPage = path.equals("/") ||
                               path.equals("/index.jsp") ||
                               path.equals("/jsp/auth/login.jsp") || 
                               path.equals("/jsp/auth/register.jsp") || 
                               path.equals("/login") || 
                               path.equals("/register") ||
                               path.startsWith("/css/") || 
                               path.startsWith("/js/") || 
                               path.startsWith("/images/");

        boolean isLoggedIn = (session != null && session.getAttribute("user") != null);

        if (isLoggedIn || isPublicPage) {
            chain.doFilter(request, response);
        } else {
            res.sendRedirect(req.getContextPath() + "/jsp/auth/login.jsp");
        }
    }
}

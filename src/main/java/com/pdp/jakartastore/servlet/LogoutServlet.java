package com.pdp.jakartastore.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

/**
 * @author Aliabbos Ashurov
 * @since 09/July/2024  11:35
 **/
@WebServlet(name = "LogoutServlet", urlPatterns = "/views/base/logout")
public class LogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/base/logout.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String confirm = req.getParameter("confirm");
        if ("yes".equals(confirm)) {
            HttpSession session = req.getSession(false);
            if (session != null) {
                session.invalidate();
                Cookie[] cookies = req.getCookies();
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("JSESSIONID")) {
                        cookie.setMaxAge(0);
                        resp.addCookie(cookie);
                    }
                }
            }
            resp.sendRedirect(req.getContextPath() + "/views/base/main.jsp");
        } else {
            resp.sendRedirect(req.getContextPath() + "/views/base/main.jsp");
        }
    }
}

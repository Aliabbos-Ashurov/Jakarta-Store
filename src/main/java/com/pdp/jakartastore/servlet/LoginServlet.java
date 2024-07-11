package com.pdp.jakartastore.servlet;

import com.pdp.jakartastore.entity.user.Users;
import com.pdp.jakartastore.service.user.UserService;
import com.pdp.jakartastore.service.user.UserServiceImpl;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.Objects;

/**
 * @author Aliabbos Ashurov
 * @since 08/July/2024  09:20
 **/
@WebServlet(name = "LoginServlet", urlPatterns = "/views/base/login")
public class LoginServlet extends HttpServlet {
    private final UserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/base/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        try {
            Users curUser = userService.check(username, password);
            if (curUser != null) {
                HttpSession session = req.getSession();
                session.setAttribute("user_id", curUser.getId());

                Cookie cookie = new Cookie("JSESSIONID", session.getId());
                cookie.setPath("/");
                cookie.setMaxAge(60 * 30);
                resp.addCookie(cookie);

                resp.sendRedirect(req.getContextPath() + "/views/base/main.jsp");
            } else {
                req.setAttribute("errorMessage", "Invalid username or password.");
                req.getRequestDispatcher("/views/base/login.jsp").forward(req, resp);
            }
        } catch (Exception e) {
            req.setAttribute("errorMessage", "An unexpected error occurred. Please try again later.");
            req.getRequestDispatcher("/views/base/login.jsp").forward(req, resp);
        }
    }
}

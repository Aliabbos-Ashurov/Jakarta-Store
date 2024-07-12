package com.pdp.jakartastore.servlet;

import com.pdp.jakartastore.entity.user.Users;
import com.pdp.jakartastore.service.user.UserService;
import com.pdp.jakartastore.service.user.UserServiceImpl;
import jakarta.persistence.EntityExistsException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

/**
 * @author Aliabbos Ashurov
 * @since 08/July/2024  10:44
 **/
@WebServlet(name = "RegisterServlet", urlPatterns = "/views/base/register")
public class RegisterServlet extends HttpServlet {
    private final UserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/base/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fullname = req.getParameter("fullname");
        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        try {
            Users newUser = Users.builder()
                    .fullname(fullname)
                    .username(username)
                    .email(email)
                    .password(password)
                    .build();

            userService.addUser(newUser);

            HttpSession session = req.getSession();
            session.setAttribute("user_id", newUser.getId());

            Cookie cookie = new Cookie("JSESSIONID", session.getId());
            cookie.setPath("/");
            cookie.setMaxAge(60 * 30);
            resp.addCookie(cookie);

            resp.sendRedirect(req.getContextPath() + "/views/base/main");
        } catch (EntityExistsException e) {
            req.setAttribute("errorMessage", e.getMessage());
            req.getRequestDispatcher("/views/base/register.jsp").forward(req, resp);
        } catch (Exception e) {
            req.setAttribute("errorMessage", "An unexpected error occurred. Please try again later.");
            req.getRequestDispatcher("/views/base/register.jsp").forward(req, resp);
        }
    }
}

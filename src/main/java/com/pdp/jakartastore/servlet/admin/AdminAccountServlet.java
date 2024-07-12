package com.pdp.jakartastore.servlet.admin;

import com.pdp.jakartastore.entity.user.Users;
import com.pdp.jakartastore.service.user.UserService;
import com.pdp.jakartastore.service.user.UserServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * @author Aliabbos Ashurov
 * @since 11/July/2024  16:46
 **/
@WebServlet(name = "AdminAccountServlet", urlPatterns = "/views/admin/admin_account")
public class AdminAccountServlet extends HttpServlet {
    private final UserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/admin/admin_account.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        String userId = req.getParameter("user_id");
        Users user = userService.findById(userId);
        switch (action) {
            case "delete" -> {
                userService.delete(user.getId());
            }
            case "deactive" -> {
                user.setStatus(Users.Status.NOT_ACTIVE);
                userService.update(user);
            }
            case "active" -> {
                user.setStatus(Users.Status.ACTIVE);
                userService.update(user);
            }
        }
        resp.sendRedirect(req.getContextPath() + "/views/admin/admin_account.jsp");
    }
}

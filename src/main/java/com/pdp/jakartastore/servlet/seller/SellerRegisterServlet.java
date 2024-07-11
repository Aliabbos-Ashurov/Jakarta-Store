package com.pdp.jakartastore.servlet.seller;

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
 * @since 10/July/2024  09:41
 **/
@WebServlet(name = "SellerRegisterServlet", urlPatterns = "/views/seller/seller_register")
public class SellerRegisterServlet extends HttpServlet {
    private final UserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/seller/seller_register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String phone_number = req.getParameter("phone_number");
        String userId = (String) req.getSession().getAttribute("user_id");
        Users user = userService.findById(userId);
        user.setPhoneNumber(phone_number);
        user.setRole(Users.Role.SELLER);
        userService.update(user);
        resp.sendRedirect(req.getContextPath() + "/views/base/success.jsp");
    }
}

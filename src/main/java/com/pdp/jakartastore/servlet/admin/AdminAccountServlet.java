package com.pdp.jakartastore.servlet.admin;

import com.pdp.jakartastore.entity.shop.Shop;
import com.pdp.jakartastore.entity.user.Users;
import com.pdp.jakartastore.service.email.EmailService;
import com.pdp.jakartastore.service.email.EmailServiceImpl;
import com.pdp.jakartastore.service.email.MessageType;
import com.pdp.jakartastore.service.shop.ShopService;
import com.pdp.jakartastore.service.shop.ShopServiceImpl;
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
    private final ShopService shopService = new ShopServiceImpl();
    private final EmailService emailService = new EmailServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/admin/admin_account.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        String userId = req.getParameter("user_id");
        String shopId = req.getParameter("shop_id");
        Shop shop = null;
        Users user = null;
        if (userId != null) {
            user = userService.findById(userId);
        }
        if (shopId != null) {
            shop = shopService.findById(shopId);
        }
        switch (action) {
            case "delete" -> {
                userService.delete(user.getId());
            }
            case "deactive" -> {
                user.setStatus(Users.Status.NOT_ACTIVE);
                userService.update(user);
                emailService.send(user.getEmail(), "FROM JAKARTA STORE PROJECT", MessageType.FOR_USER_BLOCKING);
            }
            case "active" -> {
                user.setStatus(Users.Status.ACTIVE);
                userService.update(user);
            }
            case "active_shop" -> {
                shop.setStatus(Shop.Status.ACTIVE);
                shopService.update(shop);
            }
            case "deactive_shop" -> {
                shop.setStatus(Shop.Status.NOT_ACTIVE);
                shopService.update(shop);
                emailService.send(shop.getOwner().getEmail(), "FROM JAKARTA STORE PROJECT", MessageType.FOR_SELLER_BLOCKING);
            }
            case "accept_shop" -> {
                shop.setStatus(Shop.Status.ACTIVE);
                shop.getOwner().setRole(Users.Role.SELLER);
                userService.update(shop.getOwner());
                shopService.update(shop);
            }
            case "cancel_shop" -> {
                shopService.delete(shop.getId());
            }
        }
        resp.sendRedirect(req.getContextPath() + "/views/admin/admin_account.jsp");
    }
}

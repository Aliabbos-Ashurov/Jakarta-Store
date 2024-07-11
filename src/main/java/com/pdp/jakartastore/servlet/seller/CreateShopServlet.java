package com.pdp.jakartastore.servlet.seller;

import com.pdp.jakartastore.entity.shop.Shop;
import com.pdp.jakartastore.entity.user.Users;
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
import java.util.Objects;

/**
 * @author Aliabbos Ashurov
 * @since 10/July/2024  10:41
 **/
@WebServlet(name = "CreateShopServlet", urlPatterns = "/views/seller/create_shop")
public class CreateShopServlet extends HttpServlet {
    private final ShopService shopService = new ShopServiceImpl();
    private final UserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("views/seller/create_shop.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String address = req.getParameter("address");
        String id = (String) req.getSession().getAttribute("user_id");
        Users user = userService.findById(id);
        Shop shop = Shop.builder()
                .name(name)
                .address(address)
                .owner(user)
                .phone(Objects.requireNonNullElse(user.getPhoneNumber(), "UNKNOWN PHONE NUMBER"))
                .build();
        shopService.save(shop);
        resp.sendRedirect(req.getContextPath() + "/views/base/success.jsp");
    }
}

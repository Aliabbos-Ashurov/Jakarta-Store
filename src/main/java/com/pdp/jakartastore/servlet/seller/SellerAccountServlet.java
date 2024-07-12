package com.pdp.jakartastore.servlet.seller;

import com.pdp.jakartastore.service.shop.ShopService;
import com.pdp.jakartastore.service.shop.ShopServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * @author Aliabbos Ashurov
 * @since 10/July/2024  09:53
 **/
@WebServlet(name = "SellerAccountServlet", urlPatterns = "/views/seller/seller_account")
public class SellerAccountServlet extends HttpServlet {
    private final ShopService shopService = new ShopServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/seller/seller_account.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String shopId = req.getParameter("shop_id");
        String action = req.getParameter("action");
        switch (action) {
            case "manage" -> {
                req.setAttribute("shop_id", shopId);
                req.getSession().setAttribute("shop_id", shopId);
                req.getRequestDispatcher("/views/seller/seller_shop.jsp").forward(req, resp);
            }
            case "delete" -> {
                shopService.delete(shopId);
                resp.sendRedirect(req.getContextPath() + "/views/seller/seller_account");
            }
        }
    }
}

package com.pdp.jakartastore.servlet.seller;

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
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/seller/seller_account.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String shopId = req.getParameter("shop_id");
        req.setAttribute("shop_id", shopId);
        req.getSession().setAttribute("shop_id", shopId);
        req.getRequestDispatcher("/views/seller/seller_shop.jsp").forward(req, resp);
    }
}

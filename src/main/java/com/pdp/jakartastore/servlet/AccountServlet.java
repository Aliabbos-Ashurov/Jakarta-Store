package com.pdp.jakartastore.servlet;

import com.pdp.jakartastore.entity.cart.Cart;
import com.pdp.jakartastore.service.cart.CartService;
import com.pdp.jakartastore.service.cart.CartServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * @author Aliabbos Ashurov
 * @since 09/July/2024  17:09
 **/
@WebServlet(name = "AccountServlet", urlPatterns = "/views/base/account")
public class AccountServlet extends HttpServlet {
    private final CartService cartService = new CartServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/base/account.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String cartId = req.getParameter("cart_id");
        Cart cart = cartService.findById(cartId);
        cart.setPaid(true);
        cartService.update(cart);
        resp.sendRedirect(req.getContextPath() + "/views/base/success.jsp");
    }
}

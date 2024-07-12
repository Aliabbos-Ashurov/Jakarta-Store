package com.pdp.jakartastore.servlet.seller;

import com.pdp.jakartastore.service.product.ProductService;
import com.pdp.jakartastore.service.product.ProductServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * @author Aliabbos Ashurov
 * @since 11/July/2024  12:40
 **/
@WebServlet(name = "SellerDeleteServlet", urlPatterns = "/views/seller/seller_delete")
public class SellerDeleteServlet extends HttpServlet {
    private final ProductService productService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/seller/seller_delete.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productId = req.getParameter("product_id");
        productService.delete(productId);
        resp.sendRedirect(req.getContextPath() + "/views/base/success.jsp");
    }
}

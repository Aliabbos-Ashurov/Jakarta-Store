package com.pdp.jakartastore.servlet;

import com.pdp.jakartastore.entity.product.Product;
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
 * @since 09/July/2024  12:30
 **/
@WebServlet(name = "ShopServlet", urlPatterns = "/views/base/shop")
public class ShopServlet extends HttpServlet {
    private final ProductService productService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/base/shop.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productId = req.getParameter("product_id");
        Product product = productService.findById(productId);
        req.setAttribute("product", product);
        req.getRequestDispatcher("/views/base/product_info.jsp").forward(req, resp);
    }
}

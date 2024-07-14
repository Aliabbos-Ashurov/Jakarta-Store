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
import java.util.List;

/**
 * @author Aliabbos Ashurov
 * @since 09/July/2024  12:30
 **/
@WebServlet(name = "ShopServlet", urlPatterns = "/views/base/shop")
public class ShopServlet extends HttpServlet {
    private final ProductService productService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String lowPriceParam = req.getParameter("low-price");
        String maxPriceParam = req.getParameter("max-price");
        String categoryParam = req.getParameter("category");

        int lowPrice = lowPriceParam != null && !lowPriceParam.isEmpty() ? Integer.parseInt(lowPriceParam) : 0;
        int maxPrice = maxPriceParam != null && !maxPriceParam.isEmpty() ? Integer.parseInt(maxPriceParam) : Integer.MAX_VALUE;

        System.out.println("Low Price: " + lowPrice);
        System.out.println("Max Price: " + maxPrice);
        System.out.println("Category: " + categoryParam);

        List<Product> filteredProducts;
        if (categoryParam == null || "ALL".equals(categoryParam)) {
            filteredProducts = productService.getProductsByPriceRange(lowPrice, maxPrice);
        } else {
            filteredProducts = productService.getProductsByPriceRangeAndCategory(lowPrice, maxPrice, categoryParam);
        }
        System.out.println(filteredProducts);
        req.setAttribute("products", filteredProducts);
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

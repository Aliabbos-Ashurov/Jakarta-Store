package com.pdp.jakartastore.servlet.seller;

import com.pdp.jakartastore.entity.product.Product;
import com.pdp.jakartastore.entity.shop.Shop;
import com.pdp.jakartastore.entity.upload.Upload;
import com.pdp.jakartastore.service.product.ProductService;
import com.pdp.jakartastore.service.product.ProductServiceImpl;
import com.pdp.jakartastore.service.shop.ShopService;
import com.pdp.jakartastore.service.shop.ShopServiceImpl;
import com.pdp.jakartastore.service.upload.UploadService;
import com.pdp.jakartastore.service.upload.UploadServiceImpl;
import com.pdp.jakartastore.utils.FileUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebInitParam;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.util.Objects;
import java.util.UUID;

/**
 * @author Aliabbos Ashurov
 * @since 10/July/2024  10:33
 **/
@MultipartConfig(location = "/Users/mac/Desktop/IntelliJ IDEA/JakartaStore/src/main/webapp/resources/img")
@WebServlet(name = "SellerShopServlet", urlPatterns = "/views/seller/seller_shop")
public class SellerShopServlet extends HttpServlet {
    private final UploadService uploadService = new UploadServiceImpl();
    private final ProductService productService = new ProductServiceImpl();
    private final ShopService shopService = new ShopServiceImpl();
    private static final String SAVE_DIR = "/Users/mac/Desktop/IntelliJ IDEA/JakartaStore/src/main/webapp/resources/img/";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/seller/seller_shop.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String shopId = req.getParameter("shop_id");
        if (shopId == null || shopId.trim().isEmpty()) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Shop ID is missing");
            return;
        }
        String productName = req.getParameter("productName");
        String price = req.getParameter("price");
        String description = req.getParameter("description");
        String category = req.getParameter("category");
        Part imageFilePart = req.getPart("imageFile");

        Shop shop = shopService.findById(shopId);
        if (shop == null) {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Shop not found");
            return;
        }

        String fileName = imageFilePart.getSubmittedFileName();
        String generatedName = UUID.randomUUID() + "-" + fileName;
        String savePath = SAVE_DIR + generatedName;
        imageFilePart.write(savePath);

        Upload upload = Upload.builder()
                .generatedName(generatedName)
                .fileName(fileName)
                .fileType(FileUtils.getFileType(fileName))
                .size(imageFilePart.getSize())
                .extension("../../resources/img/")
                .build();
        uploadService.save(upload);

        Product product = Product.builder()
                .image(upload)
                .shop(shop)
                .name(productName)
                .price(Integer.parseInt(price))
                .category(category)
                .description(description)
                .build();
        productService.save(product);

        resp.sendRedirect(req.getContextPath() + "/views/base/success.jsp");
    }
}

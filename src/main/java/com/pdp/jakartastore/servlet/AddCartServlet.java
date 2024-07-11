package com.pdp.jakartastore.servlet;

import com.pdp.jakartastore.entity.cart.Cart;
import com.pdp.jakartastore.entity.order.Orders;
import com.pdp.jakartastore.entity.product.Product;
import com.pdp.jakartastore.entity.user.Users;
import com.pdp.jakartastore.service.cart.CartService;
import com.pdp.jakartastore.service.cart.CartServiceImpl;
import com.pdp.jakartastore.service.order.OrderService;
import com.pdp.jakartastore.service.order.OrderServiceImpl;
import com.pdp.jakartastore.service.product.ProductService;
import com.pdp.jakartastore.service.product.ProductServiceImpl;
import com.pdp.jakartastore.service.user.UserService;
import com.pdp.jakartastore.service.user.UserServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.function.Predicate;

/**
 * @author Aliabbos Ashurov
 * @since 09/July/2024  14:36
 **/
@WebServlet(name = "AddCartServlet", urlPatterns = "/views/base/add_to_cart")
public class AddCartServlet extends HttpServlet {
    private CartService cartService;
    private OrderService orderService;
    private UserService userService;
    private ProductService productService;
    private final Predicate<Users.Role> check = (role -> role != Users.Role.ADMIN && role != Users.Role.SELLER);

    @Override
    public void init() throws ServletException {
        this.cartService = new CartServiceImpl();
        this.orderService = new OrderServiceImpl();
        this.userService = new UserServiceImpl();
        this.productService = new ProductServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/base/add_to_cart.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productId = req.getParameter("product_id");
        String userId = req.getParameter("user_id");
        String count = req.getParameter("count");

        Users users = userService.findById(userId);
        Product product = productService.findById(productId);
        if (product != null && users != null && count != null && check.test(users.getRole())) {
            Cart cart = cartService.getOrCreate(users.getId());
            Orders orders = Orders.builder()
                    .cart(cart)
                    .quantity(Integer.parseInt(count))
                    .product(product).build();

            cartService.save(cart);
            orderService.getOrCreate(orders, cart);

            resp.sendRedirect(req.getContextPath() + "/views/base/success.jsp");
        } else {
            resp.sendRedirect(req.getContextPath() + "/views/base/index.jsp");
        }
    }
}

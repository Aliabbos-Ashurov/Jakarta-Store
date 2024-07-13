package com.pdp.jakartastore.filter;

import com.pdp.jakartastore.entity.user.Users;
import com.pdp.jakartastore.service.user.UserService;
import com.pdp.jakartastore.service.user.UserServiceImpl;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;
import java.util.Objects;
import java.util.function.Predicate;

/**
 * @author Aliabbos Ashurov
 * @since 06/July/2024  17:11
 **/
@WebFilter(filterName = "SecurityFilter", value = "/*")
public class SecurityFilter implements Filter {
    private final UserService userService = new UserServiceImpl();
    private static final List<String> WHITE_LIST = List.of(
            "/",
            "/resources",
            "/views/base/index",
            "/views/base/login",
            "/views/base/register",
            "/views/base/main.jsp",
            "/views/base/main",
            "/views/base/shop"
    );
    private static final List<String> USER_LIST = List.of(
            "/views/base/account",
            "/views/base/account.jsp"
    );
    private static final Predicate<String> isOpen = uri -> WHITE_LIST.stream().anyMatch(uri::matches);
    private static final Predicate<String> isUserPages = uri -> USER_LIST.stream().anyMatch(uri::matches);
    private static final Predicate<String> isAdminPages = uri -> uri.startsWith("/views/admin");
    private static final Predicate<String> isSellerPages = uri -> uri.startsWith("/views/seller");

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse resp = (HttpServletResponse) servletResponse;

        String path = req.getServletPath();
        System.out.println("servlet path = " + path);

        if (isOpen.test(path)) {
            filterChain.doFilter(req, resp);
        } else {
            HttpSession session = req.getSession(false);
            String userId = (session != null) ? (String) session.getAttribute("user_id") : null;
            if (Objects.isNull(userId)) {
                resp.sendRedirect(req.getContextPath() + "/views/base/login");
            } else {
                Users user = userService.findById(userId);
                Users.Role role = user.getRole();
                if (Objects.equals(role, Users.Role.USER) && isAdminPages.test(path)) {
                    resp.sendError(HttpServletResponse.SC_FORBIDDEN, "Permission denied");
                } else if (Objects.equals(role, Users.Role.SELLER) && isAdminPages.test(path)) {
                    resp.sendError(HttpServletResponse.SC_FORBIDDEN, "Permission denied");
                } else if (Objects.equals(role, Users.Role.USER) && isSellerPages.test(path) && !path.startsWith("/views/seller/seller_register")) {
                    resp.sendError(HttpServletResponse.SC_FORBIDDEN, "Permission denied");
                } else if (Objects.equals(role, Users.Role.SELLER) && isUserPages.test(path)) {
                    resp.sendError(HttpServletResponse.SC_FORBIDDEN, "Permission denied");
                } else if (Objects.equals(role, Users.Role.ADMIN) && isUserPages.test(path)) {
                    resp.sendError(HttpServletResponse.SC_FORBIDDEN, "Permission denied");
                } else if (Objects.equals(role, Users.Role.ADMIN) && isSellerPages.test(path)) {
                    resp.sendError(HttpServletResponse.SC_FORBIDDEN, "Permission denied");
                } else {
                    filterChain.doFilter(req, resp);
                }
            }
        }
    }
}

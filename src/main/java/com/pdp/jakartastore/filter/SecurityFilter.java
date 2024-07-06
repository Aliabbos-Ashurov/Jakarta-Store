package com.pdp.jakartastore.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;
import java.util.function.Predicate;

/**
 * @author Aliabbos Ashurov
 * @since 06/July/2024  17:11
 **/
@WebFilter(filterName = "SecurityFilter", value = "/*")
public class SecurityFilter implements Filter {
    private final List<String> WHITE_LIST = List.of(
            "", "", "", "", "", "", ""
    );
    private final Predicate<String> predicate = WHITE_LIST::contains;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse res = (HttpServletResponse) servletResponse;

        String userId = req.getParameter("user_id");
    }

    @Override
    public void destroy() {

    }
}

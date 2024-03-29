package com.demo.entities;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebFilter(urlPatterns = {"/admin/addNewEmployeeByAdmin", "/admin/addNewBrand", "/admin/addNewProductColor"
		, "/admin/addnewproduct", "/admin/addNewVersion", "/admin/newaccount" , "/admin/updateemployee"})

/**
 * Servlet Filter implementation class RoleFilterAdmin
 */
public class RoleFilterAdmin extends HttpFilter implements Filter {
       
    /**
     * @see HttpFilter#HttpFilter()
     */
    public RoleFilterAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		HttpSession session = httpRequest.getSession();
		Account account = (Account) session.getAttribute("accountAdmin");
		if(account != null && (account.getRole().equalsIgnoreCase("0"))) {
			chain.doFilter(request, response);
		} else {
			String referer = httpRequest.getHeader("referer");
            httpResponse.sendRedirect(referer);
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}

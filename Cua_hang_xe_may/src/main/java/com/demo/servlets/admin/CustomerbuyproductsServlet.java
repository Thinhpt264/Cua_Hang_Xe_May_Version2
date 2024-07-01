package com.demo.servlets.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demo.entities.Customer;
import com.demo.models.CustomerModel;
@WebServlet("/admin/customerbuyproducts")
/**
 * Servlet implementation class customerbuyproductsServlet
 */
public class CustomerbuyproductsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerbuyproductsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if(action == null) {
			doGet_index(request, response);
		}else if(action.equalsIgnoreCase("delete")) {
			doGet_delete(request, response);
		}else if(action.equalsIgnoreCase("update")) {
			doGet_update(request, response);
		}
		
	}
	protected void doGet_index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CustomerModel customerModel = new CustomerModel();
		List<Customer> customers = customerModel.findAll();
		request.setAttribute("customers", customers);
 		request.setAttribute("admin", "../admin/customerbuyproducts.jsp");
		request.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(request, response);
	}
	protected void doGet_delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		System.out.println("dang xoa");
		CustomerModel customerModel = new CustomerModel();
		if(customerModel.delete(id)) {
			response.sendRedirect("customerbuyproducts");
		}
	}
	protected void doGet_update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		CustomerModel customerModel = new CustomerModel();
		Customer customer = customerModel.findCustomerById(id);
		request.setAttribute("customer", customer);
 		request.setAttribute("admin", "../admin/updateCustomer.jsp");
		request.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(request, response);

	}
	
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		if(action.equalsIgnoreCase("processUpdate")) {
			doPost_update(request, response);
		}
	}
	protected void doPost_update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		int  id = Integer.parseInt(request.getParameter("id")) ;
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String card = request.getParameter("card");
		CustomerModel customerModel = new CustomerModel();
		Customer customer = customerModel.findCustomerById(id);
		customer.setName(new String (name.getBytes("ISO-8859-1"),"UTF-8"));
		customer.setAddress(new String (address.getBytes("ISO-8859-1"),"UTF-8"));
		customer.setCard(card);
		customer.setPhone(phone);
		if(customerModel.update(customer)) {
			response.sendRedirect("customerbuyproducts");
		}
	}

}

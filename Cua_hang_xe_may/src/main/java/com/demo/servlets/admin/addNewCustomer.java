package com.demo.servlets.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demo.entities.Customer;
import com.demo.models.CustomerModel;
@WebServlet("/admin/addNewCustomer")
/**
 * Servlet implementation class addNewCustomer
 */
public class addNewCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addNewCustomer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub		
		request.setAttribute("admin", "../admin/addNewCustomer.jsp");
		request.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if(action.equalsIgnoreCase("addNewCustomer")) {
			doPost_Create(request, response);
		}
	}
	protected void doPost_Create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("dang tao");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String card = request.getParameter("card");
		CustomerModel customerModel = new CustomerModel();
		Customer customer = new Customer();
		customer.setName(new String (name.getBytes("ISO-8859-1"),"UTF-8"));
		customer.setAddress(new String (address.getBytes("ISO-8859-1"),"UTF-8"));
		customer.setCard(card);
		customer.setPhone(phone);
		if(customerModel.create(customer)) {
			response.sendRedirect("customerbuyproducts");
		}
	}
}

package com.demo.servlets.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demo.entities.Contact;
import com.demo.models.ContactModel;
import com.google.gson.Gson;
@WebServlet("/contact")
/**
 * Servlet implementation class ContactServlet
 */
public class ContactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContactServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if(action == null) {
			doGet_Index(request, response);
		}else if (action.equalsIgnoreCase("addNewContact")){
			
			doGet_Contact(request, response);
		}
		
		
	}
	protected void doGet_Index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("p", "../user/contact.jsp");
		request.getRequestDispatcher("/WEB-INF/views/layout/user.jsp").forward(request, response);
	}
	protected void doGet_Contact(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter writer = response.getWriter();
		ContactModel contactModel = new ContactModel();
		Contact contact = new Contact();
		String name = request.getParameter("name");
		System.out.println(name);
		String phoneUser = request.getParameter("phone");
		String email = request.getParameter("email");
		String content = request.getParameter("content");
		contact.setName(name);
		contact.setEmail(email);
		contact.setPhone(phoneUser);
		contact.setContent(content);
		if(contactModel.create(contact)) {
			Gson gson = new Gson();
			String message = "thanh cong";
			writer.print(gson.toJson(contact));
			System.out.println("Thanh Cong");
		}
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		
		
	}
	

}

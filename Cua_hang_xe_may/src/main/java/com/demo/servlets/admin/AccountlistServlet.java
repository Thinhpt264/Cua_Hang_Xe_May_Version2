package com.demo.servlets.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demo.entities.Account;
import com.demo.models.AccountModel;
@WebServlet("/admin/accountList")
/**
 * Servlet implementation class accountlistServlet
 */

	public class AccountlistServlet extends HttpServlet {
		private static final long serialVersionUID = 1L;
	       
	    /**
	     * @see HttpServlet#HttpServlet()
	     */
	    public AccountlistServlet() {
	        super();
	        // TODO Auto-generated constructor stub
	    }

		/**
		 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
		 */
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String action = request.getParameter("action");
			if(action == null ) {
				doGet_ViewList(request,response);
			}else if( action.equalsIgnoreCase("setStatus")) {
				doGet_SetStatus(request,response);
			}else if(action.equalsIgnoreCase("delete")) {
				doGet_Delete(request, response);
			}else if(action.equalsIgnoreCase("updateUser")) {
				doGet_Update(request, response);
			}
			
		}
		protected void doGet_Update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			System.out.println("aaaaaaaaa");
			AccountModel accountModel = new AccountModel();
			int id =  Integer.parseInt(request.getParameter("id"));
			Account account =  accountModel.findAccountById(id);
			request.setAttribute("account", account);
			request.setAttribute("admin", "../admin/updateAccount.jsp");
			request.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(request, response);
			
		}
		protected void doGet_ViewList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			AccountModel accountModel = new AccountModel();
			List<Account> accounts = accountModel.findAll();
			request.setAttribute("accounts", accounts);
			request.setAttribute("admin", "../admin/listAccount.jsp");
			request.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(request, response);
			
		}
		protected void doGet_SetStatus(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String username = request.getParameter("username");
			AccountModel accountModel = new AccountModel();
			Account account = accountModel.findAccountByUsername(username);
			System.out.println(account.toString());
			if(account.isStatus()) account.setStatus(false);
			else {
				account.setStatus(true);
			}
			if(account.getUsername().equalsIgnoreCase(username)) {
				if(accountModel.update(account)) {
					response.sendRedirect("accountList");
				}
			}

		}
		protected void doGet_Delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			AccountModel accountModel = new AccountModel();
			int id = Integer.parseInt(request.getParameter("id"));
			Account account = accountModel.findAccountById(id);
					request.setAttribute("account", account);
			if(accountModel.delete(id)) {
				response.sendRedirect("accountList");
			}
		}
		

		/**
		 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
		 */
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String action = request.getParameter("action");
			if(action.equalsIgnoreCase("processupdateUser")){
				doPost_Update(request, response);
			}
		}
		protected void doPost_Update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			System.out.println("thanh cong");
			
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			int id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			String email = request.getParameter("email");
			String address = request.getParameter("address");
			AccountModel accountModel = new AccountModel();
			Account account = accountModel.findAccountById(id);
			
			account.setEmail(email);
			account.setPhone(phone);
			account.setName(new String (name.getBytes("ISO-8859-1"),"UTF-8"));
			account.setAddress(new String (address.getBytes("ISO-8859-1"),"UTF-8"));
			
			if(accountModel.update(account)) {
				response.sendRedirect("accountList");
			}else {
				
			}
		}

	}

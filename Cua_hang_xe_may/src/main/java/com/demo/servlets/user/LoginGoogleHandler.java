package com.demo.servlets.user;
	
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.client.fluent.Request;

import com.demo.entities.Account;
import com.demo.entities.UserGoogleDto;
import com.demo.helpers.GoogleUtils;
import com.demo.helpers.RandomStringHelper;
import com.demo.models.AccountModel;


/**
* Servlet implementation class LoginGoogleServlet
*/
@WebServlet("/login-google")
public class LoginGoogleHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	/**
	* @see HttpServlet#HttpServlet()
	*/
	public LoginGoogleHandler() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	* @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	*/
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, 
IOException {
		// TODO Auto-generated method stub
		String code = request.getParameter("code");
		if (code == null || code.isEmpty()) {
			RequestDispatcher dis = request.getRequestDispatcher("/WEB-INF/views/login/login.jsp");
			dis.forward(request, response);
			} else {
			String accessToken = GoogleUtils.getToken(code);
			UserGoogleDto googlePojo = GoogleUtils.getUserInfo(accessToken);
			
			AccountModel accountModel = new AccountModel();
			Account account = accountModel.findAccountByEmail(googlePojo.getEmail());
			if(account != null) {
				request.getSession().setAttribute("account", account);	
				response.sendRedirect("home");
			} else if(account == null) {
				account = new Account();
				account.setEmail(googlePojo.getEmail());
				account.setUsername(googlePojo.getName());
				account.setRole("2");
				account.setSecurityCode(RandomStringHelper.generateRandomString(6));
				accountModel.create(account);
				request.getSession().setAttribute("account", account);	
				response.sendRedirect("home");
			}
		}
	}

	/**
	* @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	*/
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, 
IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
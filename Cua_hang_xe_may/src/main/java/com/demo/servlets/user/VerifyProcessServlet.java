package com.demo.servlets.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.demo.entities.Account;
import com.demo.helpers.MailHelper;
import com.demo.helpers.RandomStringHelper;
import com.demo.models.AccountModel;
@WebServlet("/processverify")
/**
 * Servlet implementation class VerifyProcessServlet
 */
public class VerifyProcessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VerifyProcessServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String action = request.getParameter("action");
		if(action == null) {
			doGet_Verify(request, response);
		} else if(action.equalsIgnoreCase("sendagain")) {
			doGet_SendAgain(request, response);
		}
		
	
		
	}
	protected void doGet_Verify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Account account = (Account) session.getAttribute("accountforgot");
		AccountModel accountModel = new AccountModel();
		String otp = (String) session.getAttribute("otp");
		if(otp == null) {
			otp = (String) session.getAttribute("otp1");
		}
		System.out.println(otp);
		String input1 = request.getParameter("input1");
		String input2 = request.getParameter("input2");
		String input3 = request.getParameter("input3");
		String input4 = request.getParameter("input4");
		String input5 = request.getParameter("input5");
		String input6 = request.getParameter("input6");
		String input = input1 + input2+ input3+ input4+ input5+ input6;
		if(otp.equalsIgnoreCase(input)) {
			response.sendRedirect("changePassword");
		}else {
			session.setAttribute("error2", "otp không chính xác");
			response.sendRedirect("verifyuser?action=verify");
			
		}
	}
	protected void doGet_SendAgain(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String otp = RandomStringHelper.generateRandomString(6);
		HttpSession session = request.getSession();
		session.removeAttribute("otp");
		Account account = (Account) session.getAttribute("accountforgot");
		System.out.println(account.toString());
		String email = account.getEmail();
		MailHelper.MailHelper(email,"Lấy Lại Mật Khẩu Của Bạn" , "Đây là mã xác thực để lấy lại mật khẩu của bạn " + otp +" Vui Lòng không cung cấp cho bất kì ai" );
		System.out.println(account.toString());
		session.setAttribute("otp1", otp);
		response.sendRedirect("verifyuser?action=verify");
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

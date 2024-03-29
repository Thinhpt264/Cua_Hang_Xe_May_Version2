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
@WebServlet("/verifyuser")

/**
 * Servlet implementation class ForgotPassServlet
 */
public class ForgotPassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgotPassServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action") ;
		if(action == null ) {
			doGet_ForgotPass(request, response);
		} else if(action.equalsIgnoreCase("verify")) {
			doGet_Verify(request, response);
		} else if(action.equalsIgnoreCase("processverify")) {
			doGet_ProcessVerify(request, response);
		}
	}
	private void doGet_ProcessVerify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	private void doGet_Verify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/WEB-INF/views/login/verify.jsp").forward(request, response);
	}

	protected void doGet_ForgotPass(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		System.out.println(email);
		AccountModel accountModel = new AccountModel();
		Account account = accountModel.findAccountByEmail(email);
		if(account != null) {
			HttpSession session = request.getSession();
			session.setAttribute("accountforgot", account);
			String otp = RandomStringHelper.generateRandomString(6);
			MailHelper.MailHelper(email,"Lấy Lại Mật Khẩu Của Bạn" , "Đây là mã xác thực để lấy lại mật khẩu của bạn /n" + otp +"/n Vui Lòng không cung cấp cho bất kì ai" );
			System.out.println(account.toString());
			session.setAttribute("otp", otp);
			session.removeAttribute("otp1");
			response.sendRedirect("verifyuser?action=verify");
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("error1", "Khong Tim Thay Email");
			response.sendRedirect("login?action=forgotpassword");
		}
		
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
}
}

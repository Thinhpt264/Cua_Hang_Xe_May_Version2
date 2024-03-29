package com.demo.servlets.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.demo.entities.Account;
import com.demo.helpers.UploadFileHelper;
import com.demo.models.AccountModel;
@WebServlet("/information")
@MultipartConfig(
		
		maxFileSize = 1024 * 1024 * 5 ,
		maxRequestSize = 1024 * 1024 * 10,
		fileSizeThreshold = 1024 * 1024 * 10

)
/**
 * Servlet implementation class InformationServlet
 */
public class InformationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InformationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		request.setAttribute("p", "../user/information.jsp");
		request.getRequestDispatcher("/WEB-INF/views/layout/user.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = (String) request.getParameter("action");
		if(action.equalsIgnoreCase("update")) {
			doPost_Update(request, response);
		}
	}
	protected void doPost_Update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		AccountModel accountModel = new AccountModel();
		Account account = (Account) request.getSession().getAttribute("account");
		Part photo2 = request.getPart("avatar");
		String address = request.getParameter("address");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String avatar = account.getAvartar() ;
				
				if(photo2 != null && photo2.getSize() > 0) {
					avatar = UploadFileHelper.uploadFile("assets/user/Image", request, photo2);
				} 
		account.setAvartar(avatar);
		account.setName(new String(name.getBytes("ISO-8859-1"), "UTF-8"));
		account.setAddress(new String(address.getBytes("ISO-8859-1"), "UTF-8"));
		account.setPhone(phone);
		if(accountModel.update(account)) {
			request.getSession().setAttribute("account", account);
			response.sendRedirect("information");
		} else {
			System.out.println("aaa");
			response.sendRedirect("information");
		}
		
	}
}
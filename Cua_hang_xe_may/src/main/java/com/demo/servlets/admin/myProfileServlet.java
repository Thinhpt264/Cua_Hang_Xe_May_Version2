package com.demo.servlets.admin;

import java.io.IOException;
import java.nio.file.Path;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.demo.entities.Account;
import com.demo.entities.Employee;
import com.demo.helpers.UploadFileHelper;
import com.demo.models.AccountModel;
import com.demo.models.EmployeeModel;
import com.google.iam.v1.AuditConfigDelta.Action;
@WebServlet("/admin/myProfile")
@MultipartConfig(
		maxFileSize = 1024 * 1024 * 5 ,
		maxRequestSize = 1024 * 1024 * 10,
		fileSizeThreshold = 1024 * 1024 * 10
)
/**
 * Servlet implementation class myProfileServlet
 */
public class myProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public myProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AccountModel accountModel = new AccountModel();
		EmployeeModel employeeModel = new EmployeeModel();
		Account account = (Account) request.getSession().getAttribute("accountAdmin");
		Employee employee = employeeModel.findEmployeeByAccountId(account.getId());
		request.setAttribute("employee", employee);
		request.setAttribute("admin", "../admin/myProfile.jsp");
		request.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		if(action.equalsIgnoreCase("update")) {
			doPost_Update(request, response);
		}
	}
	protected void doPost_Update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AccountModel accountModel = new AccountModel();
		EmployeeModel employeeModel = new EmployeeModel();
		Account account = (Account) request.getSession().getAttribute("accountAdmin");
		Employee employee = employeeModel.findEmployeeByAccountId(account.getId());
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String card = request.getParameter("card");
		Part avatar = request.getPart("avatar");
		String newAvatar = UploadFileHelper.uploadFile("assets/user/Image", request, avatar);
		System.out.println(newAvatar);
		account.setName(name);
		account.setEmail(email);
		account.setPhone(phone);
		account.setAvartar(newAvatar);
		if(accountModel.update(account)) {
			employee.setCardID(card);
			employeeModel.update(employee);
			request.getSession().setAttribute("accountAdmin", account);
			response.sendRedirect("myProfile");
		} else {
		 System.out.println("aaa");
		}
	}

}

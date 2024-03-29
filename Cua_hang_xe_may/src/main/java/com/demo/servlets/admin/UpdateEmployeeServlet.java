package com.demo.servlets.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demo.entities.Account;
import com.demo.entities.Employee;
import com.demo.models.AccountModel;
import com.demo.models.EmployeeModel;
@WebServlet("/admin/updateemployee")
/**
 * Servlet implementation class UpdateEmployeeServlet
 */
public class UpdateEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateEmployeeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action= request.getParameter("action");
		if(action == null){
			int id =Integer.parseInt(request.getParameter("id"));
			EmployeeModel employeeModel = new EmployeeModel();
			Employee employee = employeeModel.findEmployeebyId(id);
			request.setAttribute("employee", employee);
			request.setAttribute("admin", "../admin/updateEmployee.jsp");
			request.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(request, response);
		}else if(action.equalsIgnoreCase("upRole")) {
			doGet_UpRole(request, response);
		}
		
	}
	protected void doGet_UpRole(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id =Integer.parseInt(request.getParameter("id"));
		EmployeeModel employeeModel = new EmployeeModel();
		AccountModel accountModel = new AccountModel();
		Employee employee = employeeModel.findEmployeebyId(id);
		Account account = accountModel.findAccountById(employee.getAccountID());
		account.setRole("0");
		if(accountModel.update(account)) {
			request.getSession().setAttribute("message", " Thanh Cong");
			response.sendRedirect("employee");
		}else {
			request.getSession().setAttribute("message", "Chỉnh Sửa Không Thành Công");
			response.sendRedirect("employee");
		}
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
		int id =Integer.parseInt(request.getParameter("id"));
		int accountId = Integer.parseInt(request.getParameter("accountId"));
		AccountModel accountModel = new AccountModel();
		
		String card = request.getParameter("card");
		double salary = Double.parseDouble(request.getParameter("salary"));
		EmployeeModel employeeModel = new EmployeeModel();
		Employee employee = employeeModel.findEmployeebyId(id);
		employee.setAccountID(accountId);
		Account account = accountModel.findAccountById(accountId);
		account.setRole("1");
		employee.setCardID(card);
		employee.setSalary(salary);
		if(employeeModel.update(employee)) {
			accountModel.update(account);
			request.getSession().setAttribute("message", " Thanh Cong");
			response.sendRedirect("employee");
		}else {
			request.getSession().setAttribute("message", "Chỉnh Sửa Không Thành Công");
			response.sendRedirect("employee");
		}
	}

}

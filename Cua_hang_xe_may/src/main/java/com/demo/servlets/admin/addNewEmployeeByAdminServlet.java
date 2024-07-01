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
@WebServlet("/admin/addNewEmployeeByAdmin")
/**
 * Servlet implementation class addNewEmployeeByAdminServlet
 */
public class addNewEmployeeByAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addNewEmployeeByAdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("admin","../admin/addNewEmployeeByAdmin.jsp");
		request.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		if(action.equalsIgnoreCase("newEmployee")) {
				doPost_Create(request, response);
			}
		
	}
	protected void doPost_Create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("accountId")) ;
		String card = request.getParameter("card");
		double salary = Double.parseDouble(request.getParameter("salary"));
		AccountModel accountModel = new AccountModel();
		Account account = accountModel.findAccountById(id);
		EmployeeModel employeeModel = new EmployeeModel();
		Employee employee = new Employee();
		employee.setAccountID(id);
		employee.setCardID(card);
		employee.setSalary(salary);
		if(employeeModel.create(employee)) {
			
				account.setRole("1");
				accountModel.update(account);
			
			response.sendRedirect("employee");
	
		}else {
			response.sendRedirect("addNewEmployeeByAdmin");
		}
	}

}

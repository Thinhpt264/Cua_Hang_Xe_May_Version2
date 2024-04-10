 package com.demo.servlets.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demo.entities.WarehouseInvoice;
import com.demo.models.WareHouseModel;
@WebServlet("/admin/addNewImport")
/**
 * Servlet implementation class addNewImportServlet
 */
public class addNewImportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addNewImportServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setAttribute("admin", "../admin/importProduct.jsp");
		request.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		if(action.equalsIgnoreCase("import")) {
			doPost_importProduct(request, response);
		}else {
			System.out.println("không tìm đc");
		}
	}
	protected void doPost_importProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		System.out.println(request.getParameter("idColorss"));
		int idColor = Integer.parseInt(request.getParameter("idColorss")); 
		int idEmployee = Integer.parseInt(request.getParameter("idEmployee"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		double price = Double.parseDouble(request.getParameter("price"));
		String date = request.getParameter("date");
		WarehouseInvoice whi = new WarehouseInvoice();
		whi.setColorId(idColor);
		whi.setEmployeeId(idEmployee);
		whi.setQuantity(quantity);
		whi.setTradeDate(date);
		whi.setPrice(price);
		WareHouseModel whModel = new WareHouseModel();
		if(whModel.create(whi)) {
			response.sendRedirect("importProduct");
		}else {
			System.out.println("error");
		}
		
		System.out.println(idColor);
	}
}

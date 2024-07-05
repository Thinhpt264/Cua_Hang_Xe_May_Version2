package com.demo.servlets.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demo.entities.WarehouseInvoice;
import com.demo.models.WareHouseModel;
@WebServlet("/admin/importProduct")
/**
 * Servlet implementation class ImportProductServlet
 */
public class ImportProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ImportProductServlet() {
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
		}
		else if(action.equalsIgnoreCase("addNewImport")) {
			doGet_importProduct(request, response);
		}
		else if(action.equalsIgnoreCase("delete")) {
			doGet_Delete(request, response);
		}
	
	}
	protected void doGet_Index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setAttribute("admin", "../admin/listImportProduct.jsp");
		request.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(request, response);
	
	}

	protected void doGet_importProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("admin", "../admin/importProduct.jsp");
		request.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet_Delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		WareHouseModel wareHouseModel = new WareHouseModel();
		int id = Integer.parseInt(request.getParameter("id"));
		if(wareHouseModel.delete(id)) {
			System.out.println("delete import thanh cong");
			response.sendRedirect("importProduct");
		}else {
			System.out.println("that bai");
		}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

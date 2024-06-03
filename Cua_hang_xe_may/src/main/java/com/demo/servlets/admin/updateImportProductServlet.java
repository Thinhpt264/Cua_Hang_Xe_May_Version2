package com.demo.servlets.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.demo.entities.WarehouseInvoice;
import com.demo.models.WareHouseModel;

/**
 * Servlet implementation class updateImportProductServlet
 */
@WebServlet("/admin/updateImport")
public class updateImportProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateImportProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 	request.setCharacterEncoding("UTF-8");
	        response.setCharacterEncoding("UTF-8");
	        int id = Integer.parseInt(request.getParameter("id"));
	        WareHouseModel model = new WareHouseModel();
	        WarehouseInvoice warehouseInvoice = model.findInvoiceByID(id);
	        int colorId = Integer.parseInt(request.getParameter("nameproduct"));
	        double price = Double.parseDouble(request.getParameter("price1"));
	        int quantity = Integer.parseInt(request.getParameter("quantity1"));
	        String date = request.getParameter("date1");
	        int employee = Integer.parseInt(request.getParameter("nameEmployee"));
	        
	        warehouseInvoice.setColorId(colorId);
	        warehouseInvoice.setPrice(price);
	        warehouseInvoice.setQuantity(quantity);
	        warehouseInvoice.setTradeDate(date);
	        warehouseInvoice.setEmployeeId(employee);  
	        
	        if(model.update(warehouseInvoice)){
	            request.getSession().setAttribute("message","thanh cong");
	            response.sendRedirect("importProduct");
	            System.out.println("Update thanh cong");
	        }
	        else {
	            HttpSession session = request.getSession();
	            session.setAttribute("responUri", "addNewBrand");
	            response.sendRedirect("messageError");
	            System.out.println("Update thất bại");
	        }
	}

}

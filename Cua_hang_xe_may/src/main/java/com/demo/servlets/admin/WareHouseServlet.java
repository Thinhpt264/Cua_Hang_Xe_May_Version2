package com.demo.servlets.admin;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demo.entities.Account;
import com.demo.entities.Log;
import com.demo.entities.ProductColor;
import com.demo.entities.WarehouseInvoice;
import com.demo.helpers.ConfigIP;
import com.demo.helpers.IPAddressUtil;
import com.demo.models.ColorModel;
import com.demo.models.LogModel;
import com.demo.models.WareHouseModel;
import com.google.gson.Gson;
@WebServlet("/admin/warehouse")
/**
 * Servlet implementation class WareHouseServlet
 */
public class WareHouseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WareHouseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
				String action = request.getParameter("action");
				if(action == null) {
					doGet_Index(request, response);
				}else if(action.equalsIgnoreCase("delete")) {
					doGet_Delete(request, response);
				}else if(action.equalsIgnoreCase("update")) {
					doGet_Update(request, response);
				}
	}

	private void doGet_Index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ColorModel colorModel = new ColorModel();
		List<ProductColor> productColors = colorModel.findAll();
		request.setAttribute("productColors", productColors);
		String currentPath = "/admin/warehouse"; // Đường dẫn mong muốn
        request.setAttribute("currentPath", currentPath);
		request.setAttribute("admin", "../admin/ListWareHouse.jsp");
		request.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(request, response);
	}
	private void doGet_Delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ColorModel colorModel = new ColorModel();
		List<ProductColor> productColors = colorModel.findAll();
		request.setAttribute("productColors", productColors);
		String currentPath = "/admin/warehouse"; // Đường dẫn mong muốn
		Account a = (Account) request.getSession().getAttribute("accountAdmin");
		LogModel logModel = new LogModel();
		Gson gson = new Gson();
		String after = gson.toJson(colorModel);
		logModel.create(new Log(IPAddressUtil.getPublicIPAddress(),"danger" , ConfigIP.ipconfig(request).getCountryLong(), new Timestamp(new Date().getTime()), "Xóa 1 Sản Phẩm", null, after ,a.getId() ) );
        request.setAttribute("currentPath", currentPath);
		request.setAttribute("admin", "../admin/ListWareHouse.jsp");
		request.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(request, response);
	}
	private void doGet_Update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
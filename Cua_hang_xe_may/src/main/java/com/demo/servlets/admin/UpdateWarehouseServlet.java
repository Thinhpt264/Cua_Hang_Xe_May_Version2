package com.demo.servlets.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.demo.entities.ProductColor;
import com.demo.helpers.UploadFileHelper;
import com.demo.models.ColorModel;
@WebServlet("/admin/updatewarehouse")
/**
 * Servlet implementation class UpdateWarehouseServlet
 */
public class UpdateWarehouseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateWarehouseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("id"));
		ColorModel colorModel = new ColorModel();
		ProductColor color = colorModel.findColorById(id);
		request.setAttribute("color", color);
		request.setAttribute("admin", "../admin/updateWarehouse.jsp");
		request.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("updateWarehouse");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		int quantity = Integer.parseInt(request.getParameter("quantities"));
		int id = Integer.parseInt(request.getParameter("id"));
		ColorModel colorModel = new ColorModel();
		ProductColor color = colorModel.findColorById(id);
		System.out.println(id);
		System.out.println(request.getParameter("quantities"));
		
		
		
		color.setQuantity(quantity);
	
		if(colorModel.update(color)) {
			request.getSession().setAttribute("message", " Thành Công");
			response.sendRedirect("warehouse");
		}else {
			request.getSession().setAttribute("message", "Chỉnh Sửa Không Thành Công");
			response.sendRedirect("warehouse");
		}
	}

}
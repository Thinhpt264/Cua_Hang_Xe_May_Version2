package com.demo.servlets.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demo.entities.ProductColor;
import com.demo.models.ColorModel;
import com.demo.models.ProductModel;
@WebServlet("/admin/productcolor")
/**
 * Servlet implementation class ProductColorServlet
 */
public class ProductColorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductColorServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		if(action == null) {
			doGet_Index(request, response);
		}else if(action.equalsIgnoreCase("delete")) {
			doGet_Delete(request, response);
		}else if(action.equalsIgnoreCase("update")) {
			doGet_UpdateColor(request, response);
		}
	}
	protected void doGet_UpdateColor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			int id = Integer.parseInt(request.getParameter("id"));
			ColorModel colorModel = new ColorModel();
			ProductColor color = colorModel.findColorById(id);
			request.setAttribute("color", color);
			request.setAttribute("admin", "../admin/updateColor.jsp");
			request.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(request, response);
		}
	protected void doGet_Delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		ColorModel colorModel = new ColorModel();
		ProductModel productModel = new ProductModel();
		ProductColor productColor = productModel.findProductColorById(id);
		if(colorModel.delete(id)) {
			response.sendRedirect("productcolor");
		}
	}
	protected void doGet_Index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ColorModel colorModel = new ColorModel();
		List<ProductColor> productColors = colorModel.findAll();
		request.setAttribute("productColors", productColors);
		request.setAttribute("admin", "../admin/productColor.jsp");
		request.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

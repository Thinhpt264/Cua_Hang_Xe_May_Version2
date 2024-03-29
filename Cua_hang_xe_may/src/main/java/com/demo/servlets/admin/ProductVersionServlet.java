package com.demo.servlets.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demo.entities.Customer;
import com.demo.entities.ProductVersion;
import com.demo.models.CustomerModel;
import com.demo.models.VersionModel;
@WebServlet("/admin/productversion")
/**
 * Servlet implementation class ProductVersionServlet
 */
public class ProductVersionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductVersionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		if(action==null) {
			doGet_Index(request, response);
		}else if(action.equalsIgnoreCase("delete")) {
			doGet_Delete(request, response);
		}else if(action.equalsIgnoreCase("update")) {
			doGet_Update(request, response);
		}
	}
	protected void doGet_Update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		VersionModel versionModel = new VersionModel();
		ProductVersion version = versionModel.findVersionById(id);
		request.setAttribute("version", version);
		request.setAttribute("admin", "../admin/updateVersion.jsp");
		request.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(request, response);
	}
	protected void doGet_Index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		VersionModel versionModel = new VersionModel();
		List<ProductVersion> productVersions = versionModel.findAll();
		request.setAttribute("productVersions", productVersions);
		request.setAttribute("admin", "../admin/productVersion.jsp");
		request.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(request, response);
	
	}
	protected void doGet_Delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		VersionModel versionModel = new VersionModel();
		if(versionModel.delete(id)) {
			response.sendRedirect("productversion");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if(action.equalsIgnoreCase("updateVersion")) {
			doPost_Update(request, response);
		}
	}
	protected void doPost_Update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		int  id = Integer.parseInt(request.getParameter("id")) ;
		int productId = Integer.parseInt(request.getParameter("productId"));
//		String name = request.getParameter("productId");
		String versionname = request.getParameter("nameVersion");
		double price = Double.parseDouble(request.getParameter("price"));
		VersionModel versionModel = new VersionModel();
		ProductVersion version = versionModel.findVersionById(id);
		version.setVersionName(new String (versionname.getBytes("ISO-8859-1"),"UTF-8"));
		version.setPrice(price);
		version.setProductID(productId);
		if(versionModel.update(version)) {
			response.sendRedirect("productversion");
		} 
	
	
	}

}

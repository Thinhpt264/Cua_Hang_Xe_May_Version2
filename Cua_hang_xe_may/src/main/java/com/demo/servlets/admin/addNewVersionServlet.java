package com.demo.servlets.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demo.entities.ProductVersion;
import com.demo.models.VersionModel;
@WebServlet("/admin/addNewVersion")
/**
 * Servlet implementation class addNewVersion
 */
public class addNewVersionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addNewVersionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("admin", "../admin/addNewVersion.jsp");
		request.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = (String) request.getParameter("action");
		if(action.equalsIgnoreCase("addnewVersion")) {
			doPost_Addversion(request, response);
		}
	}
	protected void doPost_Addversion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		VersionModel versionModel = new VersionModel();
		String versionName = request.getParameter("name");
		int productID = Integer.parseInt(request.getParameter("proID"));
		double price = Double.parseDouble(request.getParameter("price"));
		ProductVersion productVersion = new ProductVersion();
		productVersion.setVersionName(new String(versionName.getBytes("ISO-8859-1"), "UTF-8"));
		productVersion.setProductID(productID);
		productVersion.setPrice(price);
		if(versionModel.create(productVersion)) {
			response.sendRedirect("addNewProductColor");
		}else {
			response.sendRedirect("messageError");
			}
		}
}

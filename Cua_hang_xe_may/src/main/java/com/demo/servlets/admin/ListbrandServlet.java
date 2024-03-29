package com.demo.servlets.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demo.entities.Brand;
import com.demo.models.BrandModel;
@WebServlet("/admin/listbrand")
/**
 * Servlet implementation class ListbrandServlet
 */
public class ListbrandServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListbrandServlet() {
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
		}else if(action.equalsIgnoreCase("delete")) {
			doGet_Delete(request, response);
		}else if(action.equalsIgnoreCase("update")) {
			doGet_Update(request, response);
		}
				
	}
	protected void doGet_Update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		BrandModel brandModel = new BrandModel();
		Brand brand = brandModel.findBrandbyId(id);
		request.setAttribute("brand", brand);
		request.setAttribute("admin", "../admin/updateBrand.jsp");
		request.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(request, response);
	
	}
	protected void doGet_Index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BrandModel brandModel = new BrandModel();
		List<Brand> brands = brandModel.findAll();
		request.setAttribute("brands", brands);
		request.setAttribute("admin", "../admin/listbrand.jsp");
		request.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(request, response);
	
	}
	protected void doGet_Delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BrandModel brandModel = new BrandModel();
		int id = Integer.parseInt(request.getParameter("id"));
		if(brandModel.delete(id)) {
			response.sendRedirect("listbrand");
		}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

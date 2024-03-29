package com.demo.servlets.admin;

import java.io.IOException;

import javax.servlet.http.Part;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.demo.entities.Brand;
import com.demo.helpers.UploadFileHelper;
import com.demo.models.BrandModel;
@WebServlet("/admin/addNewBrand")
@MultipartConfig(
		maxFileSize = 1024 * 1024 * 5 ,
		maxRequestSize = 1024 * 1024 * 10,
		fileSizeThreshold = 1024 * 1024 * 10
)
/**
 * Servlet implementation class addNewBrand
 */
public class addNewBrand extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addNewBrand() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setAttribute("admin", "../admin/addNewBrand.jsp");
		request.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		if(action.equalsIgnoreCase("newBrand")) {
			doPost_NewBrand(request, response);
		}
		
	}
	protected void doPost_NewBrand(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		BrandModel brandModel = new BrandModel();
		Brand brand = new Brand();
		String name = request.getParameter("nameBrand");
		Part photo2 =  request.getPart("photo");
		String description = request.getParameter("description");
		String newAvatar = UploadFileHelper.uploadFile("assets/user/Image", request, photo2);
		brand.setName(name);
		brand.setDescription(new String (description.getBytes("ISO-8859-1"),"UTF-8"));
		brand.setPhoto(newAvatar);
		if(brandModel.create(brand)) {
			response.sendRedirect("listbrand");
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("responUri", "addNewBrand");
			response.sendRedirect("messageError");
		}
		
		
	}
}

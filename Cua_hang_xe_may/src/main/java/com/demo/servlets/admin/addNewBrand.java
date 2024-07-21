package com.demo.servlets.admin;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.http.Part;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.demo.entities.Account;
import com.demo.entities.Appointment;
import com.demo.entities.Brand;
import com.demo.entities.Log;
import com.demo.helpers.ConfigIP;
import com.demo.helpers.IPAddressUtil;
import com.demo.helpers.UploadFileHelper;
import com.demo.models.BrandModel;
import com.demo.models.LogModel;
import com.google.gson.Gson;
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
		int id = Integer.parseInt(request.getParameter("id"));
		Brand brand = new Brand();
		String name = request.getParameter("nameBrand");
		Part photo2 =  request.getPart("photo");
		String description = request.getParameter("description");
		String newAvatar = UploadFileHelper.uploadFile("assets/user/Image", request, photo2);
		brand.setName(name);
		brand.setDescription(new String (description.getBytes("ISO-8859-1"),"UTF-8"));
		brand.setPhoto(newAvatar);
		Account a = (Account) request.getSession().getAttribute("accountAdmin");
		LogModel logModel = new LogModel();
		Gson gson = new Gson();
		String after = gson.toJson(brand);
		logModel.create(new Log(IPAddressUtil.getPublicIPAddress(),"alert" , ConfigIP.ipconfig(request).getCountryLong(), new Timestamp(new Date().getTime()), "Thêm Thương Hiệu", null, after ,a.getId() ) );
		if(brandModel.create(brand)) {
			response.sendRedirect("listbrand");
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("responUri", "addNewBrand");
			response.sendRedirect("messageError");
		}
		
		
	}
}

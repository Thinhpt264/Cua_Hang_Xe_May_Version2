package com.demo.servlets.admin;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.demo.entities.Account;
import com.demo.entities.Log;
import com.demo.entities.ProductColor;
import com.demo.helpers.ConfigIP;
import com.demo.helpers.IPAddressUtil;
import com.demo.helpers.UploadFileHelper;
import com.demo.models.ColorModel;
import com.demo.models.LogModel;
import com.google.gson.Gson;
@WebServlet("/admin/addNewProductColor")
@MultipartConfig(
		
		maxFileSize = 1024 * 1024 * 5 ,
		maxRequestSize = 1024 * 1024 * 10,
		fileSizeThreshold = 1024 * 1024 * 10
)
/**
 * Servlet implementation class addNewProductColor
 */
public class addNewProductColorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addNewProductColorServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setAttribute("admin", "../admin/addNewProductColor.jsp");
		request.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		System.out.println(action);
		if(action.equalsIgnoreCase("addnewcolor")) {
			doPost_newColor(request, response);
			
		}
	}
	protected void doPost_newColor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		int idVersion =  Integer.parseInt(request.getParameter("idVersion"));
		String color1 = request.getParameter("color");
		String valueColor = request.getParameter("valueColor");
		double price = Double.parseDouble(request.getParameter("priceColor"));
		Part photo = request.getPart("avatar");
		String avatar = UploadFileHelper.uploadFile("assets/user/Image", request, photo);
		ProductColor color = new ProductColor();
		color.setVersionID(idVersion);
		color.setColor(new String(color1.getBytes("ISO-8859-1"), "UTF-8"));
		color.setPrice(price);
		color.setPhoto(avatar);
		color.setValue(valueColor);
		ColorModel colorModel = new ColorModel();
		Account a = (Account) request.getSession().getAttribute("accountAdmin");
		LogModel logModel = new LogModel();
		Gson gson = new Gson();
		String after = gson.toJson(color);
		logModel.create(new Log(IPAddressUtil.getPublicIPAddress(),"alert" , ConfigIP.ipconfig(request).getCountryLong(), new Timestamp(new Date().getTime()), "Thêm Màu Xe Mới", null, after ,a.getId() ) );
		if(colorModel.create(color)) {
			response.sendRedirect("productcolor");
		} else {
			System.out.println("messageError");
		}
		
	}

}

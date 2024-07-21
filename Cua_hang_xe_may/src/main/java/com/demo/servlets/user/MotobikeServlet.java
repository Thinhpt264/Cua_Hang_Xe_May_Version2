package com.demo.servlets.user;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.demo.entities.Brand;
import com.demo.entities.Motoline;
import com.demo.entities.Product;
import com.demo.models.BrandModel;
import com.demo.models.MotolineModel;
import com.demo.models.ProductModel;
import com.google.gson.Gson;
import com.google.protobuf.Internal.ListAdapter;
@WebServlet("/motobike")
/**
 * Servlet implementation class MotobikeServlet
 */
public class MotobikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MotobikeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action == null ) {
			doGet_Index(request, response);
        } else if(action.equalsIgnoreCase("filterByBrand")) {
        	filterByBrand(request, response);
        }else if(action.equalsIgnoreCase("filterByName")) {
        	filterByName(request, response);
        }else if(action.equalsIgnoreCase("filterByMotoline")) {
        	doGet_filterByMotoline(request, response);
        }
	}
	protected void filterByBrand(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set the response type to JSON
		response.setContentType("application/json; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter writer = response.getWriter();
		String idB = request.getParameter("brandFilter");
        ProductModel productModel = new ProductModel();
        List<Product> products;
        if (idB == null) {
            products = productModel.findAll();
        } else {
            int brandId = Integer.parseInt(idB);
           
            if (brandId == 0) {
                products = productModel.findAll();
            } else {
                products  = productModel.findbyBrand(brandId);
            }
            
        }

        // Convert products list to JSON and write to response
        Gson gson = new Gson();
        writer.print(gson.toJson(products));
    }
	protected void filterByName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set the response type to JSON
		response.setContentType("application/json; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter writer = response.getWriter();
		String name = request.getParameter("name");
        ProductModel productModel = new ProductModel();
        List<Product> products;
        if (name == null) {
            products = productModel.findAll();
        } else {
           products = productModel.findbyName(name); 
        }

        // Convert products list to JSON and write to response
        Gson gson = new Gson();
        writer.print(gson.toJson(products));
    }
	
	protected void doGet_Index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// Sau đó gọi brandModel và MotolineModel Để gọi đến cơ sở dữ liệu để lấy ra danh sách tất cả hãng xe và dòng xe
		// Mặc định lúc đầu hệ thống sẽ hiển thị tất cả các xe có trong cơ sở dữ liệu
		// Form sau khi được gửi thì servlet sẽ nhận được ở đây 
		// nhận về các value của option
		// Gọi ProductModel Ra để sử dụng các value để kết nối đến cơ sở dữ liệu 
				
				String idB = request.getParameter("brandFilter");
				String idM = request.getParameter("motolineFilter");
				ProductModel productModel = new ProductModel();
				List<Product> products = null;
				BrandModel brandModel = new BrandModel();
				List<Brand> brands = brandModel.findAll();
				request.setAttribute("brands", brands);
				MotolineModel motolineModel = new MotolineModel();
				List<Motoline> motolines = motolineModel.findAll();
				request.setAttribute("motolines", motolines);
				if(idB == null && idM == null ) {
					products = productModel.findAll();
				} else {
					int brandId = Integer.parseInt(idB);
					int motolineId = Integer.parseInt(idM);
					if (brandId == 0 && motolineId == 0) {
					    products = productModel.findAll();
					} else if (brandId == 0) {
					    products = productModel.findbyMotoline(motolineId);
					} else if (motolineId == 0) {
					    products = productModel.findbyBrand(brandId);
					} else {
					    products = productModel.findbyMotolineAndBrand(motolineId, brandId);
					}
				}
				HttpSession session = request.getSession();
				if(session.getAttribute("items") != null) {
					session.removeAttribute("items");
				}
				request.setAttribute("products", products);
				request.setAttribute("p","../user/motobike.jsp");
				request.getRequestDispatcher("/WEB-INF/views/layout/user.jsp").forward(request, response);
	}
	protected void doGet_filterByMotoline(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set the response type to JSON
		response.setContentType("application/json; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter writer = response.getWriter();
		String idB = request.getParameter("motolineFilter");
        ProductModel productModel = new ProductModel();
        List<Product> products;
        if (idB == null) {
            products = productModel.findAll();
        } else {
            int motolineId = Integer.parseInt(idB);

            if (motolineId == 0) {
                products = productModel.findAll();
            } else {
                products  = productModel.findbyMotoline(motolineId);
            }
        	}
        Gson gson = new Gson();
        writer.print(gson.toJson(products));
        }
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		
	}
	

}
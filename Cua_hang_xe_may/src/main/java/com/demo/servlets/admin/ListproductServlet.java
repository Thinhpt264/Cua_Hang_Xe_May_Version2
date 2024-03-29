package com.demo.servlets.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.demo.entities.Account;
import com.demo.entities.Product;
import com.demo.helpers.UploadFileHelper;
import com.demo.models.AccountModel;
import com.demo.models.ProductModel;
@WebServlet("/admin/listproduct")
/**
 * Servlet implementation class ListproductServlet
 */
public class ListproductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListproductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if(action == null){
			doGet_viewList(request, response);
		}else if(action.equalsIgnoreCase("delete")) {
			doGet_Delete(request, response);
		}else if(action.equalsIgnoreCase("updateProduct")) {
			doGet_Update(request, response);
		}
		
	}
	protected void doGet_Update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AccountModel accountModel = new AccountModel();
		ProductModel productModel = new ProductModel();
		int id =  Integer.parseInt(request.getParameter("id"));
		Product product = productModel.findProductById(id);
		request.setAttribute("product1", product);
		request.setAttribute("admin", "../admin/updateProduct.jsp");
		request.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(request, response);
	}
	protected void doGet_viewList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductModel productModel = new ProductModel();
		List<Product> products = productModel.findAll();
		request.setAttribute("products", products);
		request.setAttribute("admin", "../admin/listproduct.jsp");
		request.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(request, response);
	}
	protected void doGet_Delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idS = request.getParameter("id");
		int id = Integer.parseInt(idS);
		ProductModel productModel = new ProductModel();
		if(productModel.delete(id)) {
			response.sendRedirect("listproduct");
		} else {
			System.out.println();
		}
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		if(action.equalsIgnoreCase("processUpdate")) {
			doPost_Update(request, response);
		}
	}
	protected void doPost_Update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("dopostUpdate");
		ProductModel productModel = new ProductModel();
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		int id = Integer.parseInt(request.getParameter("id"));
		Product product = productModel.findProductById(id);
		double price = Double.parseDouble(request.getParameter("price1"));
		System.out.println(request.getParameter("price1") + "bbbb");
		String name = request.getParameter("name");
		
		int brandId = Integer.parseInt(request.getParameter("brandId"));
		int motolineId = Integer.parseInt(request.getParameter("motolineId"));
		String description = request.getParameter("description");
		
		Part avatar = request.getPart("avatar") ;
		
		String weight = request.getParameter("weight");
		String size = request.getParameter("size");
		String saddleHeight = request.getParameter("saddleHeight");
		String petrolCapacity = request.getParameter("petrolCapacity");
		
		String wheelSize = request.getParameter("wheelSize");
		String beforeFork = request.getParameter("beforeFork");
		String afterFork = request.getParameter("afterFork");
		String maxiumCapacity = request.getParameter("maxiumCapacity");
		String oilCapacity = request.getParameter("oilCapacity");
		
		String fuelConsumption = request.getParameter("fuelConsumption");
		String cylinderCapacity = request.getParameter("cylinderCapacity");
		String maxiumMoment = request.getParameter("maxiumMoment");
		String compressionRatio = request.getParameter("compressionRatio");
		String engieType = request.getParameter("engieType");
		String avatar2 = product.getAvatar() ;
		System.out.println(avatar2);
		if(avatar != null && avatar.getSize() > 0) {
			avatar2 = UploadFileHelper.uploadFile("assets/user/Image", request, avatar);
		} 
		System.out.println(avatar2);
		product.setName(new String (name.getBytes("ISO-8859-1"),"UTF-8"));
		product.setPrice(price);
		product.setBrandID(brandId);
		product.setMotolineID(motolineId);
		product.setDescription(new String (description.getBytes("ISO-8859-1"),"UTF-8"));
		product.setAvatar(avatar2);
		
		product.setWeight(new String (weight.getBytes("ISO-8859-1"),"UTF-8"));
		product.setSize(new String (size.getBytes("ISO-8859-1"),"UTF-8"));
		product.setSaddleHeight(new String (saddleHeight.getBytes("ISO-8859-1"),"UTF-8"));
		product.setPetrolCapacity(new String (petrolCapacity.getBytes("ISO-8859-1"),"UTF-8"));
		
		product.setWheelSize(new String (wheelSize.getBytes("ISO-8859-1"),"UTF-8"));
		product.setBeforeFork(new String (beforeFork.getBytes("ISO-8859-1"),"UTF-8"));
		product.setAfterFork( new String (afterFork.getBytes("ISO-8859-1"),"UTF-8"));
		product.setMaxiumCapacity( new String (maxiumCapacity.getBytes("ISO-8859-1"),"UTF-8"));
		product.setOilCapacity(new String (oilCapacity.getBytes("ISO-8859-1"),"UTF-8"));
		
		product.setFuelConsumption(new String (fuelConsumption.getBytes("ISO-8859-1"),"UTF-8"));
		product.setCylinderCapacity(new String (cylinderCapacity.getBytes("ISO-8859-1"),"UTF-8"));
		product.setMaxiumMoment(new String (maxiumMoment.getBytes("ISO-8859-1"),"UTF-8"));
		product.setCompressionRatio(new String (compressionRatio.getBytes("ISO-8859-1"),"UTF-8"));
		product.setEngieType(new String (engieType.getBytes("ISO-8859-1"),"UTF-8"));
		
		if(productModel.update(product)) {
			response.sendRedirect("listproduct");
			System.out.println("cap nhat thanh cong");
		}else {
			response.sendRedirect("listproduct");
			System.out.println("Khong thanh cong");
		}
	}

}

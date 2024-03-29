package com.demo.servlets.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.demo.entities.Product;
import com.demo.helpers.UploadFileHelper;
import com.demo.models.ProductModel;
@WebServlet("/admin/updateproduct")
@MultipartConfig(
		
		maxFileSize = 1024 * 1024 * 5 ,
		maxRequestSize = 1024 * 1024 * 10,
		fileSizeThreshold = 1024 * 1024 * 10
)
/**
 * Servlet implementation class UpdateProductServlet
 */
public class UpdateProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		int id = Integer.parseInt(request.getParameter("id"));

		ProductModel productModel = new ProductModel();
		Product product = productModel.findProductById(id);
//		String price1 = request.getParameter("price2");
	
		double price1 = Double.parseDouble(request.getParameter("price1"));
		
		String name = request.getParameter("name");
		
		int brandId = Integer.parseInt(request.getParameter("brandId"));
		int motolineId = Integer.parseInt(request.getParameter("motolineId"));
		String description = request.getParameter("description");
		
		Part avatar = request.getPart("avatar") ;
		String weight = request.getParameter("weight");
		String size = request.getParameter("size");
		String saddleHeight = request.getParameter("saddleHeight");
		String petrolCapacity = request.getParameter("petrolCapacity");
		String newAvatarName = UploadFileHelper.uploadFile("assets/user/Image", request, avatar);
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
		
		
		product.setName(new String (name.getBytes("ISO-8859-1"),"UTF-8"));
		product.setPrice(price1);
		product.setBrandID(brandId);
		product.setMotolineID(motolineId);
		product.setDescription(description);
		
		product.setAvatar(avatar2);
//		product.setWeight(new String (weight.getBytes("ISO-8859-1"),"UTF-8"));
//		product.setSize(new String (size.getBytes("ISO-8859-1"),"UTF-8"));
//		product.setSaddleHeight(new String (saddleHeight.getBytes("ISO-8859-1"),"UTF-8"));
//		product.setPetrolCapacity(new String (petrolCapacity.getBytes("ISO-8859-1"),"UTF-8"));
//		
//		product.setWheelSize(new String (wheelSize.getBytes("ISO-8859-1"),"UTF-8"));
//		product.setBeforeFork(new String (beforeFork.getBytes("ISO-8859-1"),"UTF-8"));
//		product.setAfterFork( new String (afterFork.getBytes("ISO-8859-1"),"UTF-8"));
//		product.setMaxiumCapacity( new String (maxiumCapacity.getBytes("ISO-8859-1"),"UTF-8"));
//		product.setOilCapacity(new String (oilCapacity.getBytes("ISO-8859-1"),"UTF-8"));
//		
//		product.setFuelConsumption(new String (fuelConsumption.getBytes("ISO-8859-1"),"UTF-8"));
//		product.setCylinderCapacity(new String (cylinderCapacity.getBytes("ISO-8859-1"),"UTF-8"));
//		product.setMaxiumMoment(new String (maxiumCapacity.getBytes("ISO-8859-1"),"UTF-8"));
//		product.setCompressionRatio(new String (compressionRatio.getBytes("ISO-8859-1"),"UTF-8"));
//		product.setEngieType(new String (engieType.getBytes("ISO-8859-1"),"UTF-8"));
		
//		 product.setPrice(price);
		  product.setWeight(weight);
		  product.setSize(size);
		  product.setPetrolCapacity(petrolCapacity);
		  product.setSaddleHeight(saddleHeight);
		  
		  product.setWheelSize(wheelSize);
		  product.setBeforeFork(beforeFork);
		  product.setAfterFork(afterFork);
		  product.setMaxiumCapacity(maxiumCapacity);
		  product.setOilCapacity(oilCapacity);
		  
		  product.setFuelConsumption(fuelConsumption);
		  product.setCylinderCapacity(cylinderCapacity);
		  product.setMaxiumMoment(maxiumMoment);
		  product.setCompressionRatio(compressionRatio);
		  product.setEngieType(engieType);
	
		if(productModel.update(product)) {
			response.sendRedirect("listproduct");
			System.out.println("cap nhat thanh cong");
		}	

	}

}

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
import com.demo.entities.ProductColor;
import com.demo.entities.ProductVersion;
import com.demo.helpers.UploadFileHelper;
import com.demo.models.ColorModel;
import com.demo.models.ProductModel;
import com.demo.models.VersionModel;
@WebServlet("/admin/addnewproduct")
@MultipartConfig(
		
				maxFileSize = 1024 * 1024 * 5 ,
				maxRequestSize = 1024 * 1024 * 10,
				fileSizeThreshold = 1024 * 1024 * 10
)
/**
 * Servlet implementation class addNewProductsServlet
 */
public class addNewProductsServlet extends HttpServlet {
	  static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addNewProductsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if(action == null) {
			doGet_view(request, response);
		} 
		
	}
	protected void doGet_view(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("admin", "../admin/addNewProducts.jsp");
		request.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(request, response);
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if(action.equalsIgnoreCase("addnew")) {
			doPost_upLoad(request, response);
		}
	}
	protected void doPost_upLoad(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		ProductModel productModel = new ProductModel();
		  String brandID = request.getParameter("brandId");
		  String motolineID =  request.getParameter("motolineId"); // dong xe (tay ga, xe so, phan khoi lon)
		  Part avatar = request.getPart("avatar") ; // anh dai dien cua san pham
		  String name = request.getParameter("name"); // ten san pham
		  String description = request.getParameter("description"); // mo ta san pham
		  double price =Double.parseDouble(request.getParameter("price")) ; // gia
		  String weight = request.getParameter("weight"); // khối lượng bản thân
		  String size = request.getParameter("size"); // dài x rộng x cao
		  String petrolCapacity = request.getParameter("petrolCapacity");// dung tích bình xăng
		  String saddleHeight = request.getParameter("saddleHeight");// độ cao yên
		  String wheelSize = request.getParameter("wheelSize"); // kích cỡ lốp trước sau
		  String beforeFork = request.getParameter("beforeFork"); // phuộc trước
		  String afterFork= request.getParameter("afterFork");// phuộc sau
		  String maxiumCapacity = request.getParameter("maxiumCapacity");// công suất tối đa
		  String oilCapacity = request.getParameter("oilCapacity"); // dung tích nhớt máy
		  String fuelConsumption = request.getParameter("fuelConsumption"); // mức tiêu thụ nhiên liệu
		  String cylinderCapacity = request.getParameter("cylinderCapacity"); // dung tích xi-lanh
		  String maxiumMoment= request.getParameter("maxiumMoment"); // moment cực đại
		  String compressionRatio= request.getParameter("compressionRatio");// tỉ số nén
		  String engieType= request.getParameter("engieType");
		  String newAvatarName = UploadFileHelper.uploadFile("assets/user/Image", request, avatar);
		  System.out.println(newAvatarName);
		  Product product = new Product();
		  product.setBrandID(Integer.parseInt(brandID));
		  product.setAvatar(newAvatarName);
		  product.setMotolineID(Integer.parseInt(motolineID));
		  
		  product.setName(new String(name.getBytes("ISO-8859-1"), "UTF-8"));
		  product.setDescription(new String(description.getBytes("ISO-8859-1"), "UTF-8"));
//		  product.setPrice(price);
//		  product.setWeight(weight);
//		  product.setSize(size);
//		  product.setPetrolCapacity(petrolCapacity);
//		  product.setSaddleHeight(saddleHeight);
//		  product.setWheelSize(wheelSize);
//		  product.setBeforeFork(beforeFork);
//		  product.setAfterFork(afterFork);
//		  product.setMaxiumCapacity(maxiumCapacity);
//		  product.setOilCapacity(oilCapacity);
//		  product.setFuelConsumption(fuelConsumption);
//		  product.setCylinderCapacity(cylinderCapacity);
//		  product.setMaxiumMoment(maxiumMoment);
//		  product.setCompressionRatio(compressionRatio);
//		  product.setEngieType(engieType);
//		  product.setName(new String (name.getBytes("ISO-8859-1"),"UTF-8"));
			product.setPrice(price);
//			product.setBrandID(brandId);
//			product.setMotolineID(motolineId);
//			product.setDescription(new String(description.getBytes("ISO-8859-1"),"UTF-8"));
			
			product.setAvatar(newAvatarName);
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
			product.setMaxiumMoment(new String (maxiumCapacity.getBytes("ISO-8859-1"),"UTF-8"));
			product.setCompressionRatio(new String (compressionRatio.getBytes("ISO-8859-1"),"UTF-8"));
			product.setEngieType(new String (engieType.getBytes("ISO-8859-1"),"UTF-8"));
		  if(productModel.create(product)) {
			 VersionModel versionModel = new VersionModel();
			 ProductVersion productversion = new ProductVersion();
			 
			 String name2 = "Phiên Bản Tiêu Chuẩn" ;
			productversion.setVersionName(name2);
			productversion.setPrice(price);
			productversion.setProductID(productModel.findLast().getId());
			 if(versionModel.create(productversion)) {
				 ColorModel colorModel = new ColorModel();
				 ProductColor color = new ProductColor();
				 String name3 = " Tiêu Chuẩn" ;
				 color.setColor(name3);
				 color.setPhoto(newAvatarName);
				 color.setPrice(price);
				 color.setValue("black-white");
				 color.setVersionID(versionModel.findLast().getId());
				 colorModel.create(color);
			 }
			 response.sendRedirect("addNewVersion");
		  } else {
			  System.out.println("false");
		  }
		  
		  
	}
	

}

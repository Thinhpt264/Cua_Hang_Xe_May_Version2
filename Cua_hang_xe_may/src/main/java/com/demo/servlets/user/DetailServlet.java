package com.demo.servlets.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demo.entities.Comment;
import com.demo.entities.CommentCustom;
import com.demo.entities.Image;
import com.demo.entities.Product;
import com.demo.entities.ProductColor;
import com.demo.entities.ProductVersion;
import com.demo.models.CommentModel;
import com.demo.models.ImageModel;
import com.demo.models.ProductModel;
import com.google.gson.Gson;
@WebServlet("/details")
/**
 * Servlet implementation class DetailServlet
 */
public class DetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailServlet() {
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
		} else if(action.equalsIgnoreCase("changeVersion")) {
			doGet_ChangeVersion(request, response);
		} else if(action.equalsIgnoreCase("loadComment")) {
			doGet_LoadComment(request, response);
		}
	}
	protected void doGet_Index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductModel productModel = new ProductModel();
		CommentModel commentModel = new CommentModel();
		String idProdut = request.getParameter("id") ;
		int id = Integer.parseInt(idProdut);
		ImageModel imageModel = new ImageModel();
		List<Image> images = imageModel.findByProductId(id);
		System.out.println(idProdut);
		Product product = productModel.findProductById(id);
		System.out.println(product.toString());
		if(product != null) {
			request.setAttribute("product", product);
			request.setAttribute("images", images);
		} else {
			response.sendRedirect("motobike");
		}
		request.setAttribute("p", "../user/detailProduct.jsp");
		request.getRequestDispatcher("/WEB-INF/views/layout/user.jsp").forward(request, response);
	}
	protected void doGet_LoadComment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		String productID = request.getParameter("productID");
		int id = Integer.parseInt(productID);
		PrintWriter writer = response.getWriter();
		CommentModel commentModel = new CommentModel();
		Gson gson = new Gson();
		writer.print(gson.toJson(commentModel.newComment(id)));
	}
	protected void doGet_ChangeVersion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter writer = response.getWriter();
		int colorID = Integer.parseInt(request.getParameter("colorID"));
		ProductModel productModel = new ProductModel();
		Gson gson = new Gson();
		Map<String, Object> data = new HashMap<String, Object>();
		ProductColor color = productModel.findProductColorById(colorID);
		data.put("color", color);
		ProductVersion version = productModel.findProductVersionById(color.getVersionID());
		data.put("version", version);
		writer.print(gson.toJson(data));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		if(action.equalsIgnoreCase("comment")) {
			doPost_Comment(request, response);
		}
	}
	protected void doPost_Comment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String idProduct = request.getParameter("productId");
		String idAccount = request.getParameter("accountId");
		if(idAccount.equalsIgnoreCase("notAccount")){
			response.sendRedirect("login");
		}
		int idProducts = Integer.parseInt(idProduct);
		int idAccounts = Integer.parseInt(idAccount);
		String content = request.getParameter("content");
		System.out.println(content);
		CommentModel commentModel = new CommentModel();
		Comment comment = new Comment();
		comment.setProductId(idProducts);
		comment.setAccountId(idAccounts);
		comment.setContent(new String(content.getBytes("ISO-8859-1"), "UTF-8"));
		if(commentModel.create(comment)) {
			response.sendRedirect("details?id="+idProducts);
		} else {
			response.sendRedirect("login");
		}
			}

}

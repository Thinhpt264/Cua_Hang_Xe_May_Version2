package com.demo.servlets.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demo.entities.Item;
import com.demo.entities.Product;
import com.demo.entities.ProductColor;
import com.demo.entities.ProductVersion;
import com.demo.helpers.CartHelper;
import com.demo.models.ProductModel;
import com.google.gson.Gson;
@WebServlet("/cart")
/**
 * Servlet implementation class CartServlet
 */
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartServlet() {
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
		}else if(action.equalsIgnoreCase("buynow")) {
			doGet_Buy(request, response);
		}else if(action.equalsIgnoreCase("remove")) {
			doGet_Remove(request, response);
		}else if(action.equalsIgnoreCase("plus")) {
			doGet_Plus(request, response);
		}else if(action.equalsIgnoreCase("minus")) {
			doGet_Minus(request, response);
		}else if(action.equalsIgnoreCase("openAppent")) {
			doGet_OpenAppent(request, response);
		}else if(action.equalsIgnoreCase("additem")) {
			doGet_addItem(request, response);
		}else if(action.equalsIgnoreCase("showTotal")) {
			doGet_showTotal(request, response);
		}else if(action.equalsIgnoreCase("removeItem")) {
			doGet_removeItem(request, response);
		}
		
	}
	protected void doGet_Index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("p", "../user/cart.jsp");
		request.getRequestDispatcher("/WEB-INF/views/layout/user.jsp").forward(request, response);
	}
	protected void doGet_Buy(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		System.out.println(id);
		ProductModel productModel = new ProductModel();
		ProductColor productcolor = productModel.findProductColorById(id);
		if(request.getSession().getAttribute("cart") == null) {
			List<Item> cart = new ArrayList<Item>();
			cart.add(new Item(productcolor, 1));
			request.getSession().setAttribute("cart", cart);
		}else {
			List<Item> cart = 	(List<Item>) request.getSession().getAttribute("cart");
			int index = CartHelper.exist(cart, id);
			if(index == -1) {
				cart.add(new Item(productcolor, 1));
			} else {
				int quantity = cart.get(index).getQuantity()+1;
				cart.get(index).setQuantity(quantity);
			}
			request.getSession().setAttribute("cart", cart);
		}
		response.sendRedirect("cart");
	}
	protected void doGet_Remove(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int index = Integer.parseInt(request.getParameter("index"));
		List<Item> items = 	(List<Item>) request.getSession().getAttribute("items");
		List<Item> cart = 	(List<Item>) request.getSession().getAttribute("cart");
		if(items != null) {
			for (Item item : items) {
				if(item.checkExitProductColor(cart.get(index).getProductcolor().getId())) {
					items.remove(item);
				}
			}
		
			request.getSession().setAttribute("items", items);
		}
		cart.remove(index);
		request.getSession().setAttribute("cart", cart);
		
		
		response.sendRedirect("cart");
	}
	protected void doGet_Plus(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		int index = Integer.parseInt(request.getParameter("index"));
		List<Item> cart = 	(List<Item>) request.getSession().getAttribute("cart");
		int quantity = cart.get(index).getQuantity()+1;
		cart.get(index).setQuantity(quantity);
		request.getSession().setAttribute("cart", cart);
		response.sendRedirect("cart");
		PrintWriter writer = response.getWriter();
		Gson gson = new Gson();
		writer.print(gson.toJson(cart));
		
	}

	protected void doGet_Minus(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int index = Integer.parseInt(request.getParameter("index"));
		List<Item> cart = 	(List<Item>) request.getSession().getAttribute("cart");
		if(cart.get(index).getQuantity() != 1) {
			int quantity = cart.get(index).getQuantity()-1;
			cart.get(index).setQuantity(quantity);
		}else {
			cart.remove(index);
		}
		request.getSession().setAttribute("cart", cart);
		response.sendRedirect("cart");
	}
	protected void doGet_OpenAppent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		int index = Integer.parseInt(request.getParameter("itemId"));
		System.out.println(index);
		List<Item> cart = 	(List<Item>) request.getSession().getAttribute("cart");
		Item item = cart.get(index);
		ProductModel productModel = new ProductModel();
		ProductColor productColor = productModel.findProductColorById(item.getProductcolor().getId());
		ProductVersion productVersion = productModel.findProductVersionById(productColor.getVersionID());
		Product product = productModel.findProductById(productVersion.getProductID());
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("productColor", productColor);
		data.put("productVersion", productVersion);
		data.put("product", product);
		data.put("item", item);
		PrintWriter writer = response.getWriter();
		Gson gson = new Gson();
		writer.print(gson.toJson(data));
	}
	protected void doGet_addItem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		int index = Integer.parseInt(request.getParameter("itemId"));
		Map<String, Object> data = new HashMap<String, Object>();
		System.out.println(index);
		List<Item> cart = 	(List<Item>) request.getSession().getAttribute("cart");
		Item item = cart.get(index);
		int id = item.getProductcolor().getId();
		if(request.getSession().getAttribute("items")== null) {
			List<Item> items = new ArrayList<Item>();
			items.add(item);
			data.put("items", items);
			request.getSession().setAttribute("items", items);
			System.out.println(items);
		}else {
			List<Item> items = (List<Item>) request.getSession().getAttribute("items");
			items.add(item);
			data.put("items", items);
			request.getSession().setAttribute("items", items);
			System.out.println(items);
		}
	
		String message = "Thanh Cong";
		data.put("message", message);
		PrintWriter writer = response.getWriter();
		Gson gson = new Gson();
		writer.print(gson.toJson(data));
	}
	protected void doGet_removeItem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		int index = Integer.parseInt(request.getParameter("itemId"));		
		System.out.println(index);
		List<Item> items = 	(List<Item>) request.getSession().getAttribute("items");
		items.remove(index);
		request.getSession().setAttribute("items", items);
		String message = "Xóa Thanh Cong";
		PrintWriter writer = response.getWriter();
		Gson gson = new Gson();
		writer.print(gson.toJson(message));
	}
	protected void doGet_showTotal(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		List<Item> items = 	(List<Item>) request.getSession().getAttribute("items");
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("items", items);
		PrintWriter writer = response.getWriter();
		Gson gson = new Gson();
		writer.print(gson.toJson(data));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

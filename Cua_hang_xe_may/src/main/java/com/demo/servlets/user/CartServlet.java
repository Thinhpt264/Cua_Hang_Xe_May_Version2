package com.demo.servlets.user;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demo.entities.Item;
import com.demo.entities.Product;
import com.demo.entities.ProductColor;
import com.demo.helpers.CartHelper;
import com.demo.models.ProductModel;
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
		}
		
	}
	protected void doGet_Index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("p", "../user/cart.jsp");
		request.getRequestDispatcher("/WEB-INF/views/layout/user.jsp").forward(request, response);
	}
	protected void doGet_Buy(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		ProductModel productModel = new ProductModel();
		ProductColor productcolor = productModel.findProductColorById(id);
		if(request.getSession().getAttribute("cart")== null) {
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
		List<Item> cart = 	(List<Item>) request.getSession().getAttribute("cart");
		cart.remove(index);
		request.getSession().setAttribute("cart", cart);
		response.sendRedirect("cart");
	}
	protected void doGet_Plus(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int index = Integer.parseInt(request.getParameter("index"));
		List<Item> cart = 	(List<Item>) request.getSession().getAttribute("cart");
		int quantity = cart.get(index).getQuantity()+1;
		cart.get(index).setQuantity(quantity);
		request.getSession().setAttribute("cart", cart);
		response.sendRedirect("cart");
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

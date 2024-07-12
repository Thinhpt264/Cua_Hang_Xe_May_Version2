package com.demo.servlets.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demo.entities.Item;
import com.demo.models.AppointmentDetailModel;
@WebServlet("/admin/productAppoinment")
/**
 * Servlet implementation class productAppoimentServlet
 */
public class productAppoimentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public productAppoimentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		AppointmentDetailModel appointmentDetailModel = new  AppointmentDetailModel();
		List<Item> productcolors = appointmentDetailModel.findAllProductColor();
		request.setAttribute("items", productcolors);
		String currentPath = "/admin/productAppoinment"; // Đường dẫn mong muốn
        request.setAttribute("currentPath", currentPath);
		request.setAttribute("admin", "../admin/productappointment.jsp");
		request.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

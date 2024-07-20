package com.demo.servlets.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demo.entities.AppointmentDetail;
import com.demo.entities.Item;
import com.demo.entities.ProductApointment;
import com.demo.entities.ProductColor;
import com.demo.models.AppointmentDetailModel;
import com.demo.models.AppointmentModel;
import com.demo.models.ColorModel;
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
		String action = request.getParameter("action");
		if(action == null) {
			doGet_Index(request, response);
		}else if(action.equalsIgnoreCase("undo")) {
			doGet_UndoProduct(request, response);
		}
		// TODO Auto-generated method stub
		
	}
	protected void doGet_Index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AppointmentDetailModel appointmentDetailModel = new  AppointmentDetailModel();
		List<ProductApointment> productcolors = appointmentDetailModel.findAllProductColor();
		request.setAttribute("items", productcolors);
		String currentPath = "/admin/productAppoinment"; // Đường dẫn mong muốn
        request.setAttribute("currentPath", currentPath);
		request.setAttribute("admin", "../admin/productappointment.jsp");
		request.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(request, response);
	}
	protected void doGet_UndoProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		System.out.println(id);
		int id1 = Integer.parseInt(id);
		AppointmentDetailModel appointmentDetailModel = new  AppointmentDetailModel();
		AppointmentModel appointmentModel = new AppointmentModel();
		AppointmentDetail appointmentDetail = appointmentDetailModel.findAppointmentDetailById(id1);
		ColorModel colorModel = new ColorModel();
		System.out.println(appointmentDetail.getId_color());
		ProductColor color = colorModel.findColorById(appointmentDetail.getId_color());
		int quantityold = color.getQuantity();
		
		if(appointmentDetailModel.delete(appointmentDetail.getId())) {
			color.setQuantity(quantityold+appointmentDetail.getQuantity());
			colorModel.update(color);
			response.sendRedirect("productAppoinment");
		}else {
			response.sendRedirect("productAppoinment");
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

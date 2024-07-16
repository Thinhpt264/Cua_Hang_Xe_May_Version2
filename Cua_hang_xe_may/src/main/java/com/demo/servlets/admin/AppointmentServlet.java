package com.demo.servlets.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demo.entities.Appointment;
import com.demo.entities.WarehouseInvoice;
import com.demo.models.AppointmentModel;
import com.demo.models.WareHouseModel;
@WebServlet("/admin/appointment")
/**
 * Servlet implementation class AppointmentServlet
 */
public class AppointmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AppointmentServlet() {
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
		}else if(action.equalsIgnoreCase("updateAppointment")) {
			doGet_updateAppointment(request,response);
		}else if(action.equalsIgnoreCase("deleteAppointment")) {
			doGet_deleteAppointment(request,response);
		}
	
	}
	protected void doGet_Index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String currentPath = "/admin/appointment"; 
        request.setAttribute("currentPath", currentPath);
		request.setAttribute("admin", "../admin/appointment.jsp");
		request.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(request, response);
	}
	protected void doGet_updateAppointment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AppointmentModel appointmentModel = new AppointmentModel();
		int id = Integer.parseInt(request.getParameter("id"));
		Appointment appointment = appointmentModel.findAppointmentById(id);
		request.setAttribute("appointment", appointment);
		request.setAttribute("admin", "../admin/updateAppointment.jsp");
		request.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(request, response);
	
	}
	protected void doGet_deleteAppointment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AppointmentModel appointmentModel = new AppointmentModel();
		int id = Integer.parseInt(request.getParameter("id"));
		if(appointmentModel.delete(id)) {
			response.sendRedirect("appointment");
		}else {
			System.out.println("xoa that bai");
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

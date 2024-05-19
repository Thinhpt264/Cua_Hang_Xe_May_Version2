package com.demo.servlets.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.demo.models.AppointmentDetailModel;
import com.demo.models.AppointmentModel;
import com.demo.entities.Appointment;
import com.demo.entities.AppointmentDetail;
import com.demo.entities.ProductColor;
@WebServlet("/appoinment")
/**
 * Servlet implementation class Appointment
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
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		if(action.equalsIgnoreCase("oneProduct")) {
			doGet_Insert(request, response);
		}
	}
	protected void doGet_Insert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		AppointmentModel appointmentModel = new AppointmentModel();
		String name = request.getParameter("name");
		String phone  = request.getParameter("phone");
		String email  = request.getParameter("email");
		String cccd = request.getParameter("cccd");
		String date = request.getParameter("date");
		int accountId = Integer.parseInt(request.getParameter("accountId"));
		Appointment appointment = new Appointment();
		appointment.setAppointmentDate(date);
		appointment.setCccd(cccd);
		appointment.setEmail(email);
		appointment.setPhone(phone);
		appointment.setName(name);
		appointment.setStatus(1);
		String[] colors =  request.getParameterValues("id_color[]");
		
		appointment.setAccountId(accountId);
		String[] quantity =  request.getParameterValues("quantity_color[]");
		String[] total_color =  request.getParameterValues("total_color[]");
		for (String s : colors) {
			System.out.println(s.toString());
		}
		if(colors != null ) {
			if(appointmentModel.create(appointment)) {
				int id = appointmentModel.findLast().getId();
				AppointmentDetailModel appointmentDetailModel = new AppointmentDetailModel();
				for (int i = 0; i < colors.length; i++ ) {
					int idC = Integer.parseInt(colors[i].trim());
					AppointmentDetail appointmentDetail = new AppointmentDetail();
					appointmentDetail.setId_color(idC);
					appointmentDetail.setId_appoiment(id);
					appointmentDetail.setQuantity(Integer.parseInt(quantity[i].trim()));
					appointmentDetail.setTotal(Double.parseDouble(total_color[i].trim()));
					appointmentDetailModel.create(appointmentDetail);
					
				}
				
					response.sendRedirect("cart");
				
			}
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
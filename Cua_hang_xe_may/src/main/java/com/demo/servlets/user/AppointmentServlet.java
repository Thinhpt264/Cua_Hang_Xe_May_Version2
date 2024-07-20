package com.demo.servlets.user;

import java.io.IOException;
import java.util.Iterator;
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
import com.demo.entities.Item;
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
		
	}
	
		/**
		 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
		 */
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			String action = request.getParameter("action");
			if(action.equalsIgnoreCase("oneProduct")) {
				doPost_Insert(request, response);
			}
		}

		private void doPost_Insert(HttpServletRequest request, HttpServletResponse response) {
			// TODO Auto-generated method stub
			AppointmentModel appointmentModel = new AppointmentModel();
			String name = request.getParameter("name");
			String phone  = request.getParameter("phone");
			String email  = request.getParameter("email");
			String cccd = request.getParameter("cccd");
			String date = request.getParameter("date");
			String deposit = request.getParameter("deposit_amount");
			String content = request.getParameter("content");
			double deposit_amount = Double.parseDouble(deposit);
			System.out.println(deposit_amount);
			int accountId = Integer.parseInt(request.getParameter("accountId"));
			Appointment appointment = new Appointment();
			appointment.setAppointmentDate(date);
			appointment.setCccd(cccd);
			appointment.setEmail(email);
			appointment.setPhone(phone);
			appointment.setName(name);
			appointment.setStatus(1);
			appointment.setDeposit_amount(deposit_amount);
			appointment.setContent(content);
			String[] colors =  request.getParameterValues("id_color[]");
			appointment.setAccountId(accountId);
			String[] quantity =  request.getParameterValues("quantity_color[]");
			String[] total_color =  request.getParameterValues("total_color[]");
			for (String s : colors) {
				System.out.println(s.toString());
			}
			List<Item> cart = (List<Item>) request.getSession().getAttribute("cart");
			for(int i = 0; i< cart.size() ; i++) {
				for(int j = 0 ; j < colors.length ; j++) {
					if(cart.get(i).checkExitProductColor(Integer.parseInt(colors[j].trim()))) {
						cart.remove(i);
					}
					
				}
			}
			System.out.println(appointment);
			if(colors != null ) {
				System.out.println(appointmentModel.create(appointment)); 
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
							try {
								
								response.sendRedirect("payment?deposit_amount="+ deposit_amount +"&id="+ id);
							} catch (IOException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
				}
			}
			
		}

	}
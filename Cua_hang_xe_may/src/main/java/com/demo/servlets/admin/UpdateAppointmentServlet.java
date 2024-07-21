package com.demo.servlets.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.demo.entities.Account;
import com.demo.entities.Appointment;
import com.demo.entities.Employee;
import com.demo.entities.Log;
import com.demo.entities.Product;
import com.demo.helpers.ConfigIP;
import com.demo.helpers.IPAddressUtil;
import com.demo.helpers.UploadFileHelper;
import com.demo.models.AccountModel;
import com.demo.models.AppointmentModel;
import com.demo.models.EmployeeModel;
import com.demo.models.LogModel;
import com.demo.models.ProductModel;
import com.google.gson.Gson;
@WebServlet("/admin/updateAppointment")
/**
 * Servlet implementation class UpdateProductServlet
 */
public class UpdateAppointmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateAppointmentServlet() {
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
		int id =Integer.parseInt(request.getParameter("id"));
		AppointmentModel appointmentModel = new AppointmentModel();
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String appooinmentDate = request.getParameter("appoinmentDate");
		String cccd = request.getParameter("cccd");
		String date_pay = request.getParameter("date_pay");
		String content = request.getParameter("content");
		double deposit_amount = Double.parseDouble(request.getParameter("deposit_amount"));
		
		
		Appointment appointment = appointmentModel.findAppointmentById(id);
		Gson gson = new Gson();
		
		String before = gson.toJson(appointment);
		appointment.setName(name);
		appointment.setEmail(email);
		appointment.setPhone(phone);
		appointment.setAppointmentDate(appooinmentDate);
		appointment.setCccd(cccd);
		appointment.setDate_pay(date_pay);
		appointment.setContent(content);
		appointment.setDeposit_amount(deposit_amount);
		
		if(appointmentModel.update(appointment)) {
			LogModel logModel = new LogModel();
			Account a = (Account) request.getSession().getAttribute("accountAdmin");
			System.out.println(a);
			Appointment productAfter = appointmentModel.findAppointmentById(id);
			String after = gson.toJson(productAfter);
			logModel.create(new Log(IPAddressUtil.getPublicIPAddress(),"warning" , ConfigIP.ipconfig(request).getCountryLong(), new Timestamp(new Date().getTime()), "Cập Nhật Cuộc Hẹn", before, after ,a.getId() ) );
			request.getSession().setAttribute("message", " Thanh Cong");
			response.sendRedirect("appointment");
		}else {
			request.getSession().setAttribute("message", "Chỉnh Sửa Không Thành Công");
			response.sendRedirect("appointment");
		}
	}

}

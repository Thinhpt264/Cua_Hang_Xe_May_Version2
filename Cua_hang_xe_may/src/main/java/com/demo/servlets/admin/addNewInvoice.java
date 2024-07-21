package com.demo.servlets.admin;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demo.entities.Account;
import com.demo.entities.Invoice;
import com.demo.entities.Log;
import com.demo.entities.ProductColor;
import com.demo.helpers.ConfigIP;
import com.demo.helpers.IPAddressUtil;
import com.demo.models.ColorModel;
import com.demo.models.InvoiceModel;
import com.demo.models.LogModel;
import com.google.gson.Gson;
@WebServlet("/admin/addNewInvoice")
/**
 * Servlet implementation class addNewInvoice
 */
public class addNewInvoice extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addNewInvoice() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		InvoiceModel invoiceModel = new InvoiceModel();
		Invoice invoice = new Invoice();
		int colorId = Integer.parseInt( request.getParameter("colorId"));
		int employeeId = Integer.parseInt( request.getParameter("employeeId"));
		int customerId = Integer.parseInt( request.getParameter("customerId"));
		double price = Double.parseDouble(request.getParameter("price"));
		Date tradeDate = new Date();
		System.out.println(tradeDate);
		invoice.setColorId(colorId);
		ColorModel colorModel = new ColorModel();
		ProductColor color = colorModel.findColorById(colorId);
		int quantity = color.getQuantity();
		color.setQuantity(quantity - 1);
		System.out.println(colorModel.update(color));
		invoice.setCustomerId(customerId);
		invoice.setEmployeeId(employeeId);
		invoice.setTradeDate(tradeDate);
		invoice.setPrice(price);
		Account a = (Account) request.getSession().getAttribute("accountAdmin");
		LogModel logModel = new LogModel();
		Gson gson = new Gson();
		String after = gson.toJson(invoice);
		logModel.create(new Log(IPAddressUtil.getPublicIPAddress(),"warning" , ConfigIP.ipconfig(request).getCountryLong(), new Timestamp(new Date().getTime()), "Nhập Hóa Đơn", null, after ,a.getId() ) );
		if(invoiceModel.create(invoice)) {
			response.sendRedirect("home");
		}
		
	}

}

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
import javax.servlet.http.HttpSession;

import com.demo.entities.Account;
import com.demo.entities.Appointment;
import com.demo.entities.AppointmentDetail;
import com.demo.entities.Product;
import com.demo.entities.ProductColor;
import com.demo.entities.ProductVersion;
import com.demo.models.AppointmentDetailModel;
import com.demo.models.AppointmentModel;
import com.demo.models.ColorModel;
import com.demo.models.ProductModel;
import com.demo.models.VersionModel;
import com.fasterxml.jackson.core.Version;
import com.google.gson.Gson;
@WebServlet("/appointcard")
/**
 * Servlet implementation class AppointmentCardServlet
 */
public class AppointmentCardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AppointmentCardServlet() {
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
		}else if(action.equalsIgnoreCase("showTotal")) {
			doGet_Show(request, response);
		}
				
	}
	protected void doGet_Index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				HttpSession session = request.getSession();
				Account account = (Account) session.getAttribute("account");
				System.out.println(account);
				AppointmentModel appointmentModel = new AppointmentModel();
				List<Appointment> appointments =  appointmentModel.findAppointmentByAccountId(account.getId());
				request.setAttribute("appointments", appointments);
				request.setAttribute("p", "../user/appointmentCard.jsp");
				request.getRequestDispatcher("/WEB-INF/views/layout/user.jsp").forward(request, response);
	}
	protected void doGet_Show(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		int appointId = Integer.parseInt(request.getParameter("itemId"));
		AppointmentDetailModel appointmentDetailModel = new AppointmentDetailModel();
		VersionModel versionModel = new VersionModel();
		ColorModel colorModel = new ColorModel();
		ProductModel productModel = new ProductModel();
		List<ProductVersion> nameVersion = new ArrayList<>();
		List<ProductColor> nameColor = new ArrayList<>();
		List<Product> nameProduct = new ArrayList<>();
	
		List<AppointmentDetail> appointmentDetails = appointmentDetailModel.findAppointmentDetailByAppoitntmentId(appointId);
		for(int i = 0; i< appointmentDetails.size(); i++)  {
			ProductVersion namever =  versionModel.findVersionById(colorModel.findColorById(appointmentDetails.get(i).getId_color()).getVersionID());
			nameVersion.add(namever);
			ProductColor namecol = colorModel.findColorById(appointmentDetails.get(i).getId_color());
			nameColor.add(namecol);
			Product namePro = productModel.findProductById(versionModel.findVersionById(colorModel.findColorById(appointmentDetails.get(i).getId_color()).getVersionID()).getProductID());
			nameProduct.add(namePro);
		}
		System.out.println(nameColor);
		Map<String, Object> data = new HashMap<>();
		data.put("appointmentDetails", appointmentDetails);
		data.put("products", nameProduct);
		data.put("versions", nameVersion);
		data.put("colors", nameColor);
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
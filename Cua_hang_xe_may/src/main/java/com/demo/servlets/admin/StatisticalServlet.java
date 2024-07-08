package com.demo.servlets.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demo.entities.OrderCountByMonth;
import com.demo.models.StatisticalModel;
import com.google.gson.Gson;
@WebServlet("/admin/statistical")
/**
 * Servlet implementation class StatisticalServlet
 */
public class StatisticalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StatisticalServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		if(action == null) {
			doGet_Index(request, response);
		}else if(action.equalsIgnoreCase("changeYear")) {
			doGet_ChangeYear(request, response);
		}
		
		
	}
	protected void doGet_Index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StatisticalModel model = new StatisticalModel();
		List<String> years = model.getYears();
		
		List<OrderCountByMonth> orderCountByMonths = model.findCountInMonthByYear(2024);
		Map<String, Integer> resultMap = new HashMap<>();
		resultMap.put("01", 0);
		resultMap.put("02", 0);
		resultMap.put("03", 0);
		resultMap.put("04", 0);
		resultMap.put("05", 0);
		resultMap.put("06", 0);
		resultMap.put("07", 0);
		resultMap.put("08", 0);
		resultMap.put("09", 0);
		resultMap.put("10", 0);
		resultMap.put("11", 0);
		resultMap.put("12", 0);
	    for (OrderCountByMonth orderCount : orderCountByMonths) {
	    	
	        String month = orderCount.getMonth();
	        int orderCountValue = orderCount.getOrderCount();
	        resultMap.put(month, orderCountValue);
	    }

	    Map<String, Integer> sortedMap = new TreeMap<>(Comparator.comparingInt(Integer::parseInt));

        sortedMap.putAll(resultMap);
	    System.out.println(sortedMap);
	    request.setAttribute("years", years);
		request.setAttribute("orderCountByMonths", sortedMap);
		request.setAttribute("admin", "../admin/statistical.jsp");
		request.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(request, response);
	
	}
	protected void doGet_ChangeYear(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		int year = Integer.parseInt(request.getParameter("year"));
		System.out.println(year);
		StatisticalModel model = new StatisticalModel();
		List<OrderCountByMonth> orderCountByMonths = model.findCountInMonthByYear(year);
		Map<String, Integer> resultMap = new HashMap<>();
		resultMap.put("01", 0);
		resultMap.put("02", 0);
		resultMap.put("03", 0);
		resultMap.put("04", 0);
		resultMap.put("05", 0);
		resultMap.put("06", 0);
		resultMap.put("07", 0);
		resultMap.put("08", 0);
		resultMap.put("09", 0);
		resultMap.put("10", 0);
		resultMap.put("11", 0);
		resultMap.put("12", 0);
	    for (OrderCountByMonth orderCount : orderCountByMonths) {
	    	
	        String month = orderCount.getMonth();
	        int orderCountValue = orderCount.getOrderCount();
	        resultMap.put(month, orderCountValue);
	    }

	    Map<String, Integer> sortedMap = new TreeMap<>(Comparator.comparingInt(Integer::parseInt));

        sortedMap.putAll(resultMap);
        PrintWriter writer = response.getWriter();
    	Gson gson = new Gson();
		writer.print(gson.toJson(sortedMap));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

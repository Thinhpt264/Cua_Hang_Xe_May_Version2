<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.demo.entities.OrderCountByMonth"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
    <%
    	Map<String, Integer> orderCountByMonths = (Map<String, Integer>) request.getAttribute("orderCountByMonths");
   		if(orderCountByMonths == null) orderCountByMonths = new HashMap<>();
   		List<String> labels = new ArrayList<>(orderCountByMonths.keySet());
   	    List<Integer> data = new ArrayList<>(orderCountByMonths.values());
   	    List<String> years = (List<String>) request.getAttribute("years");
   	    if(years == null) years = new ArrayList<>();
    %>
	
 	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
		<div class="row">
			<div class="col-md-6">
				<div class="card card-info">
		<div class="card-header">
			<h3 class="card-title">Thống Kê Các Đơn Đặt Hàng Theo Tháng </h3>
			<div class="card-tools">
			<button type="button" class="btn btn-tool" data-card-widget="collapse">
			<i class="fas fa-minus"></i>
			</button>
			<button type="button" class="btn btn-tool" data-card-widget="remove">
			<i class="fas fa-times"></i>
			</button>
			</div>
		</div>
		<div class="card-body">
		<form>
				<select id="yearSelect">
					<% for(String y: years) {%>
					<option value="<%= y %>"> <%= y %> </option>
					
					<% } %>
				</select>
			</form>
			
  			<canvas id="myChart"></canvas>
		</div>
		</div>
			</div>
			<div class="col-md-6">
			</div>
		</div>
		
		
		<script>
  const ctx = document.getElementById('myChart');
  let chart;

  $(document).ready(function() {
    chart = new Chart(ctx, {
      type: 'line',
      data: {
        labels: <%=labels  %>,
        datasets: [{
          label: 'Đơn Đặt Hẹn',
          data: <%= data%>,
          borderWidth: 2,
          fill: false,
          borderColor: 'rgba(54, 162, 235, 1)',
        }]
      },
      options: {
        scales: {
          x: {
            title: {
              display: true,
              text: 'Tháng',
              font: {
                padding: 4,
                size: 20,
                weight: 'bold',
                family: 'Arial'
              },
              color: 'darkblue',
              align: 'center'
            }
          },
          y: {
            title: {
              display: true,
              text: "Số Lượng Đơn Đặt",
              font: {
                size: 20,
                weight: 'bold',
                family: 'Arial'
              },
              color: 'darkblue',
              align: 'center'
            },
            beginAtZero: true,
            scaleLabel: {
              display: true,
              labelString: 'Values',
            }
          }
        }
      }
    });

    var yearSelect = document.getElementById("yearSelect");
    yearSelect.addEventListener("change", function() {
      var selectedYear = yearSelect.value;
      console.log(selectedYear);
      $.ajax({
        type: "GET",
        url: '${pageContext.request.contextPath}/admin/statistical',
        data: {
          year: selectedYear,
          action: 'changeYear'
        },
        success: function(sortedMap) {
        	 var keys = Object.keys(sortedMap).sort(function(a, b) {
        		    return parseInt(a) - parseInt(b);
        		  });

        		  var values = keys.map(function(key) {
        		    return sortedMap[key];
        		  });
          console.log(keys);
          console.log(values);
          chart.data.datasets[0].data = values;
          chart.data.labels = keys;
          chart.update();
        }	
      });
    });
  });
</script>

 

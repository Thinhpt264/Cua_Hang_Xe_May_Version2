/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.demo.ex;

import com.demo.entities.Appointment;
import com.demo.helpers.MailHelper;
import com.demo.models.AppointmentModel;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.IOException;import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/payment")
/**
 *
 * @author CTT VNPAY
 */
public class PaymentServlet extends HttpServlet {
	
    @Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter("action");
		if(action == null) {
			doGet_Index(req, resp);
		} else if(action.equals("paymentInfo")) {
			doGet_PaymentInfo(req, resp);
		}
	}
    protected void doGet_Index(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		HttpSession session = req.getSession();
		session.setAttribute("idAppoiment", id);
		System.out.println(id);
    	req.getRequestDispatcher("/WEB-INF/views/user/payment.jsp").forward(req, resp);
		
	}
    protected void doGet_PaymentInfo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
		SimpleDateFormat dateFormat2 = new SimpleDateFormat("dd/MM/yyyy");
  		String money = req.getParameter("vnp_Amount");
  		AppointmentModel appointmentModel = new AppointmentModel();
  		req.setAttribute("amount", Integer.parseInt(money)/100);
  		String status = req.getParameter("vnp_ResponseCode");
  		System.out.println(status);
  		int idAp = Integer.parseInt((String) req.getSession().getAttribute("idAppoiment"));
  		System.out.println(idAp);
  		try {
			req.setAttribute("created",dateFormat2.format(dateFormat.parse(req.getParameter("vnp_PayDate"))) );
			if(status.equalsIgnoreCase("00")) {
				Appointment appointment = appointmentModel.findAppointmentById(idAp);
				appointment.setStatus(0);
				appointment.setDate_pay((String) dateFormat2.format(dateFormat.parse(req.getParameter("vnp_PayDate"))));
				if(appointmentModel.update(appointment)) {
					DecimalFormat df = new DecimalFormat("#,###.##");
					String price = df.format(appointment.getDeposit_amount());
					String email = appointment.getEmail();
//					NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
//			          = currencyFormatter.format(appointment.getDeposit_amount());
					System.out.println(status.equalsIgnoreCase("00"));
					MailHelper.MailHelper(email, "Email Xác Nhận Lịch Hẹn Từ Phía Cửa Hàng", "<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"table-layout:fixed;background-color:#f9f9f9\" id=\"bodyTable\">\r\n"
							+ "	<tbody>\r\n"
							+ "		<tr>\r\n"
							+ "			<td style=\"padding-right:10px;padding-left:10px;\" align=\"center\" valign=\"top\" id=\"bodyCell\">\r\n"
							+ "				<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"wrapperWebview\" style=\"max-width:600px\">\r\n"
							+ "					<tbody>\r\n"
							+ "						<tr>\r\n"
							+ "							<td align=\"center\" valign=\"top\">\r\n"
							+ "								<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n"
							+ "									<tbody>\r\n"
							+ "										<tr>\r\n"
							+ "											<td style=\"padding-top: 20px; padding-bottom: 20px; padding-right: 0px;\" align=\"right\" valign=\"middle\" class=\"webview\"> <a href=\"#\" style=\"color:#bbb;font-family:'Open Sans',Helvetica,Arial,sans-serif;font-size:12px;font-weight:400;font-style:normal;letter-spacing:normal;line-height:20px;text-transform:none;text-align:right;text-decoration:underline;padding:0;margin:0\" target=\"_blank\" class=\"text hideOnMobile\">Oh wait, there's more! →</a>\r\n"
							+ "											</td>\r\n"
							+ "										</tr>\r\n"
							+ "									</tbody>\r\n"
							+ "								</table>\r\n"
							+ "							</td>\r\n"
							+ "						</tr>\r\n"
							+ "					</tbody>\r\n"
							+ "				</table>\r\n"
							+ "				<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"wrapperBody\" style=\"max-width:600px\">\r\n"
							+ "					<tbody>\r\n"
							+ "						<tr>\r\n"
							+ "							<td align=\"center\" valign=\"top\">\r\n"
							+ "								<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"tableCard\" style=\"background-color:#fff;border-color:#e5e5e5;border-style:solid;border-width:0 1px 1px 1px;\">\r\n"
							+ "									<tbody>\r\n"
							+ "										<tr>\r\n"
							+ "											<td style=\"background-color:#f36f21;font-size:1px;line-height:3px\" class=\"topBorder\" height=\"3\">&nbsp;</td>\r\n"
							+ "										</tr>\r\n"
							+ "										<tr>\r\n"
							+ "											<td style=\"padding-top: 60px; padding-bottom: 20px;\" align=\"center\" valign=\"middle\" class=\"emailLogo\">\r\n"
							+ "												<a href=\"#\" style=\"text-decoration:none\" target=\"_blank\">\r\n"
							+ "													<img alt=\"\" border=\"0\" src=\"https://i2-vnexpress.vnecdn.net/2023/03/16/2552pxHondaLogosvgpng-1678932914.png?w=700&h=0&q=100&dpr=1&fit=crop&s=YzBTjvMYO_BgEfHskEsP5Q&t=image\" style=\"width:100%;max-width:150px;height:auto;display:block\" width=\"150\">\r\n"
							+ "												</a>\r\n"
							+ "											</td>\r\n"
							+ "										</tr>\r\n"
							+ "										<tr>\r\n"
							+ "											<td style=\"padding-bottom: 20px;\" align=\"center\" valign=\"top\" class=\"imgHero\">\r\n"
							+ "												<a href=\"#\" style=\"text-decoration:none\" target=\"_blank\">\r\n"
							+ "													<img alt=\"\" border=\"0\" src=\"https://www.google.com/url?sa=i&url=https%3A%2F%2Fvnexpress.net%2Foto-xe-may%2Fv-bike%2Fhang-xe%2Fhonda-1&psig=AOvVaw2l3BDZQJzoF55C1dhKd1rR&ust=1720945043361000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCIDIhOzJo4cDFQAAAAAdAAAAABAE\" style=\"width:100%;max-width:600px;height:auto;display:block;color: #f9f9f9;\" width=\"600\">\r\n"
							+ "												</a>\r\n"
							+ "											</td>\r\n"
							+ "										</tr>\r\n"
							+ "										<tr>\r\n"
							+ "											<td style=\"padding-bottom: 5px; padding-left: 20px; padding-right: 20px;\" align=\"center\" valign=\"top\" class=\"mainTitle\">\r\n"
							+ "												<h2 class=\"text\" style=\"color:#000;font-family:Poppins,Helvetica,Arial,sans-serif;font-size:28px;font-weight:500;font-style:normal;letter-spacing:normal;line-height:36px;text-transform:none;text-align:center;padding:0;margin:0\">Hi " + appointment.getName() +"</h2>\r\n"
							+ "											</td>\r\n"
							+ "										</tr>\r\n"
							+ "										<tr>\r\n"
							+ "											<td style=\"padding-bottom: 30px; padding-left: 20px; padding-right: 20px;\" align=\"center\" valign=\"top\" class=\"subTitle\">\r\n"
							+ "												<h3 class=\"text\" style=\"color:#999;font-family:Poppins,Helvetica,Arial,sans-serif;font-size:16px;font-weight:500;font-style:normal;letter-spacing:normal;line-height:24px;text-transform:none;text-align:center;padding:0;margin:0\">Bạn Đã Đặt Cọc Thành Công Lịch Hẹn Xem Xe Với Số Tiền </h3>\r\n"
							+ "												<h4 style=\"color:#030202;font-family:Poppins,Helvetica,Arial,sans-serif;font-size:16px;font-weight:500;font-style:normal;letter-spacing:normal;line-height:24px;text-transform:none;text-align:center;padding:0;margin:0\">" + price +" VNĐ </h4>\r\n"
							+ "											</td>\r\n"
							+ "										</tr>\r\n"
							+ "										<tr>\r\n"
							+ "											<td style=\"padding-left:20px;padding-right:20px\" align=\"center\" valign=\"top\" class=\"containtTable ui-sortable\">\r\n"
							+ "												<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"tableDescription\" style=\"\">\r\n"
							+ "													<tbody>\r\n"
							+ "														<tr>\r\n"
							+ "															<td style=\"padding-bottom: 20px;\" align=\"center\" valign=\"top\" class=\"description\">\r\n"
							+ "																<p class=\"text\" style=\"color:#666;font-family:'Open Sans',Helvetica,Arial,sans-serif;font-size:14px;font-weight:400;font-style:normal;letter-spacing:normal;line-height:22px;text-transform:none;text-align:center;padding:0;margin:0\">Lịch Hẹn Của Bạn Đã Được Xác Nhận Ngày " + appointment.getAppointmentDate() + "</p>\r\n"
							+ "																<p class=\"text\" style=\"color:#666;font-family:'Open Sans',Helvetica,Arial,sans-serif;font-size:14px;font-weight:400;font-style:normal;letter-spacing:normal;line-height:22px;text-transform:none;text-align:center;padding:0;margin:0\">Cảm ơn bạn đã tin tưởng T-MotorShop </p>\r\n"
							+ "															</td>\r\n"
							+ "														</tr>\r\n"
							+ "													</tbody>\r\n"
							+ "												</table>\r\n"
							+ "												\r\n"
							+ "											</td>\r\n"
							+ "										</tr>\r\n"
							+ "										<tr>\r\n"
							+ "											<td style=\"font-size:1px;line-height:1px\" height=\"20\">&nbsp;</td>\r\n"
							+ "										</tr>\r\n"
							+ "										<tr>\r\n"
							+ "											<td align=\"center\" valign=\"middle\" style=\"padding-bottom: 40px;\" class=\"emailRegards\">\r\n"
							+ "												<!-- Image and Link // -->\r\n"
							+ "												<a href=\"#\" target=\"_blank\" style=\"text-decoration:none;\">\r\n"
							+ "													<img mc:edit=\"signature\" src=\"https://www.google.com/url?sa=i&url=https%3A%2F%2Fvnexpress.net%2Foto-xe-may%2Fv-bike%2Fhang-xe%2Fhonda-1&psig=AOvVaw2l3BDZQJzoF55C1dhKd1rR&ust=1720945043361000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCIDIhOzJo4cDFQAAAAAdAAAAABAE\" alt=\"\" width=\"150\" border=\"0\" style=\"width:100%;\r\n"
							+ "    max-width:150px; height:auto; display:block;\">\r\n"
							+ "												</a>\r\n"
							+ "											</td>\r\n"
							+ "										</tr>\r\n"
							+ "									</tbody>\r\n"
							+ "								</table>\r\n"
							+ "								<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"space\">\r\n"
							+ "									<tbody>\r\n"
							+ "										<tr>\r\n"
							+ "											<td style=\"font-size:1px;line-height:1px\" height=\"30\">&nbsp;</td>\r\n"
							+ "										</tr>\r\n"
							+ "									</tbody>\r\n"
							+ "								</table>\r\n"
							+ "							</td>\r\n"
							+ "						</tr>\r\n"
							+ "					</tbody>\r\n"
							+ "				</table>\r\n"
							+ "				<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"wrapperFooter\" style=\"max-width:600px\">\r\n"
							+ "					<tbody>\r\n"
							+ "						<tr>\r\n"
							+ "							<td align=\"center\" valign=\"top\">\r\n"
							+ "								<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"footer\">\r\n"
							+ "									<tbody>\r\n"
							+ "										<tr>\r\n"
							+ "											<td style=\"padding-top:10px;padding-bottom:10px;padding-left:10px;padding-right:10px\" align=\"center\" valign=\"top\" class=\"socialLinks\">\r\n"
							+ "												<a href=\"https://www.facebook.com/phanthethinh.official26/\" style=\"display:inline-block\" target=\"_blank\" class=\"facebook\">\r\n"
							+ "													<img alt=\"\" border=\"0\" src=\"http://email.aumfusion.com/vespro/img/social/light/facebook.png\" style=\"height:auto;width:100%;max-width:40px;margin-left:2px;margin-right:2px\" width=\"40\">\r\n"
							+ "												</a>\r\n"
							+ "												<a href=\"#twitter-link\" style=\"display: inline-block;\" target=\"_blank\" class=\"twitter\">\r\n"
							+ "													<img alt=\"\" border=\"0\" src=\"http://email.aumfusion.com/vespro/img/social/light/twitter.png\" style=\"height:auto;width:100%;max-width:40px;margin-left:2px;margin-right:2px\" width=\"40\">\r\n"
							+ "												</a>\r\n"
							+ "												<a href=\"#pintrest-link\" style=\"display: inline-block;\" target=\"_blank\" class=\"pintrest\">\r\n"
							+ "													<img alt=\"\" border=\"0\" src=\"http://email.aumfusion.com/vespro/img/social/light/pintrest.png\" style=\"height:auto;width:100%;max-width:40px;margin-left:2px;margin-right:2px\" width=\"40\">\r\n"
							+ "												</a>\r\n"
							+ "												<a href=\"#instagram-link\" style=\"display: inline-block;\" target=\"_blank\" class=\"instagram\">\r\n"
							+ "													<img alt=\"\" border=\"0\" src=\"http://email.aumfusion.com/vespro/img/social/light/instagram.png\" style=\"height:auto;width:100%;max-width:40px;margin-left:2px;margin-right:2px\" width=\"40\">\r\n"
							+ "												</a>\r\n"
							+ "												<a href=\"#linkdin-link\" style=\"display: inline-block;\" target=\"_blank\" class=\"linkdin\">\r\n"
							+ "													<img alt=\"\" border=\"0\" src=\"http://email.aumfusion.com/vespro/img/social/light/linkdin.png\" style=\"height:auto;width:100%;max-width:40px;margin-left:2px;margin-right:2px\" width=\"40\">\r\n"
							+ "												</a>\r\n"
							+ "											</td>\r\n"
							+ "										</tr>\r\n"
							+ "										<tr>\r\n"
							+ "											<td style=\"padding: 10px 10px 5px;\" align=\"center\" valign=\"top\" class=\"brandInfo\">\r\n"
							+ "												<p class=\"text\" style=\"color:#bbb;font-family:'Open Sans',Helvetica,Arial,sans-serif;font-size:12px;font-weight:400;font-style:normal;letter-spacing:normal;line-height:20px;text-transform:none;text-align:center;padding:0;margin:0\">©&nbsp;Vespro Inc. | 800 Broadway, Suite 1500 | New York, NY 000123, USA.</p>\r\n"
							+ "											</td>\r\n"
							+ "										</tr>\r\n"
							+ "										<tr>\r\n"
							+ "											<td style=\"padding: 0px 10px 20px;\" align=\"center\" valign=\"top\" class=\"footerLinks\">\r\n"
							+ "												<p class=\"text\" style=\"color:#bbb;font-family:'Open Sans',Helvetica,Arial,sans-serif;font-size:12px;font-weight:400;font-style:normal;letter-spacing:normal;line-height:20px;text-transform:none;text-align:center;padding:0;margin:0\"> <a href=\"#\" style=\"color:#bbb;text-decoration:underline\" target=\"_blank\">View Web Version </a>&nbsp;|&nbsp; <a href=\"#\" style=\"color:#bbb;text-decoration:underline\" target=\"_blank\">Email Preferences </a>&nbsp;|&nbsp; <a href=\"#\" style=\"color:#bbb;text-decoration:underline\" target=\"_blank\">Privacy Policy</a>\r\n"
							+ "												</p>\r\n"
							+ "											</td>\r\n"
							+ "										</tr>\r\n"
							+ "										<tr>\r\n"
							+ "											<td style=\"padding: 0px 10px 10px;\" align=\"center\" valign=\"top\" class=\"footerEmailInfo\">\r\n"
							+ "												<p class=\"text\" style=\"color:#bbb;font-family:'Open Sans',Helvetica,Arial,sans-serif;font-size:12px;font-weight:400;font-style:normal;letter-spacing:normal;line-height:20px;text-transform:none;text-align:center;padding:0;margin:0\">If you have any quetions please contact us <a href=\"#\" style=\"color:#bbb;text-decoration:underline\" target=\"_blank\">support@mail.com.</a>\r\n"
							+ "													<br> <a href=\"#\" style=\"color:#bbb;text-decoration:underline\" target=\"_blank\">Unsubscribe</a> from our mailing lists</p>\r\n"
							+ "											</td>\r\n"
							+ "										</tr>\r\n"
							+ "										<tr>\r\n"
							+ "											<td style=\"padding-top:10px;padding-bottom:10px;padding-left:10px;padding-right:10px\" align=\"center\" valign=\"top\" class=\"appLinks\">\r\n"
							+ "												<a href=\"#Play-Store-Link\" style=\"display: inline-block;\" target=\"_blank\" class=\"play-store\">\r\n"
							+ "													<img alt=\"\" border=\"0\" src=\"http://email.aumfusion.com/vespro/img/app/play-store.png\" style=\"height:auto;margin:5px;width:100%;max-width:120px\" width=\"120\">\r\n"
							+ "												</a>\r\n"
							+ "												<a href=\"#App-Store-Link\" style=\"display: inline-block;\" target=\"_blank\" class=\"app-store\">\r\n"
							+ "													<img alt=\"\" border=\"0\" src=\"http://email.aumfusion.com/vespro/img/app/app-store.png\" style=\"height:auto;margin:5px;width:100%;max-width:120px\" width=\"120\">\r\n"
							+ "												</a>\r\n"
							+ "											</td>\r\n"
							+ "										</tr>\r\n"
							+ "										<tr>\r\n"
							+ "											<td style=\"font-size:1px;line-height:1px\" height=\"30\">&nbsp;</td>\r\n"
							+ "										</tr>\r\n"
							+ "									</tbody>\r\n"
							+ "								</table>\r\n"
							+ "							</td>\r\n"
							+ "						</tr>\r\n"
							+ "						<tr>\r\n"
							+ "							<td style=\"font-size:1px;line-height:1px\" height=\"30\">&nbsp;</td>\r\n"
							+ "						</tr>\r\n"
							+ "					</tbody>\r\n"
							+ "				</table>\r\n"
							+ "			</td>\r\n"
							+ "		</tr>\r\n"
							+ "	</tbody>\r\n"
							+ "</table>");
				}
				
				
				System.out.println(appointment);
			}
  		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
  		
  		req.getRequestDispatcher("/WEB-INF/views/user/paymentsuccess.jsp").forward(req, resp);
  	}

	@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        String vnp_Version = "2.1.0";
        String vnp_Command = "pay";
        String orderType = "other";
        String money = req.getParameter("amount");
        long amount = Integer.parseInt(money) * 100;
        String bankCode = req.getParameter("bankCode");
        
        String vnp_TxnRef = Config.getRandomNumber(8);
        String vnp_IpAddr = Config.getIpAddress(req);

        String vnp_TmnCode = Config.vnp_TmnCode;
        
        Map<String, String> vnp_Params = new HashMap<>();
        vnp_Params.put("vnp_Version", vnp_Version);
        vnp_Params.put("vnp_Command", vnp_Command);
        vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
        vnp_Params.put("vnp_Amount", String.valueOf(amount));
        vnp_Params.put("vnp_CurrCode", "VND");
        
        if (bankCode != null && !bankCode.isEmpty()) {
            vnp_Params.put("vnp_BankCode", bankCode);
        }
        vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
        vnp_Params.put("vnp_OrderInfo", "Thanh toan don hang:" + vnp_TxnRef);
        vnp_Params.put("vnp_OrderType", orderType);

        String locate = req.getParameter("language");
        if (locate != null && !locate.isEmpty()) {
            vnp_Params.put("vnp_Locale", locate);
        } else {
            vnp_Params.put("vnp_Locale", "vn");
        }
        vnp_Params.put("vnp_ReturnUrl", Config.vnp_ReturnUrl);
        vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String vnp_CreateDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);
        
        cld.add(Calendar.MINUTE, 15);
        String vnp_ExpireDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);
        
        List fieldNames = new ArrayList(vnp_Params.keySet());
        Collections.sort(fieldNames);
        StringBuilder hashData = new StringBuilder();
        StringBuilder query = new StringBuilder();
        Iterator itr = fieldNames.iterator();
        while (itr.hasNext()) {
            String fieldName = (String) itr.next();
            String fieldValue = (String) vnp_Params.get(fieldName);
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                //Build hash data
                hashData.append(fieldName);
                hashData.append('=');
                hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                //Build query
                query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                query.append('=');
                query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                if (itr.hasNext()) {
                    query.append('&');
                    hashData.append('&');
                }
            }
        }
        String queryUrl = query.toString();
        String vnp_SecureHash = Config.hmacSHA512(Config.secretKey, hashData.toString());
        queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
        String paymentUrl = Config.vnp_PayUrl + "?" + queryUrl;
        System.out.println(paymentUrl);
        resp.sendRedirect(paymentUrl);
    }

}

package com.demo.entities;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

import com.google.protobuf.TextFormat.ParseException;

public class AppointmentComparator implements Comparator<Appointment> {
	
	private SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

   

    @Override
    public int compare(Appointment appointment1, Appointment appointment2) {
        
           
			try {
				Date date1 = dateFormat.parse(appointment1.getAppointmentDate());
				Date date2 = dateFormat.parse(appointment2.getAppointmentDate());
				   return date1.compareTo(date2);
			} catch (java.text.ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
          
         
        
        return 0;
    }
    public static void main(String[] args) {
     
       
        
        List<Appointment> appointments = new ArrayList<>();

        
        Appointment appointment1 = new Appointment();
        appointment1.setAppointmentDate("2024-05-27");
        appointments.add(appointment1);

        Appointment appointment2 = new Appointment();
        appointment2.setAppointmentDate("2024-05-25");
        appointments.add(appointment2);

        Appointment appointment3 = new Appointment();
        appointment3.setAppointmentDate("2024-05-26");
        appointments.add(appointment3);

       
        Collections.sort(appointments, new AppointmentComparator());

       
        for (Appointment appointment : appointments) {
            System.out.println(appointment.getAppointmentDate());
        }
    }
	
	
}

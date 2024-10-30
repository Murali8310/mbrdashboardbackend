package com.titan.MBRDashboard;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = "com.titan.MBRDashboard.service.DashboardService")

public class MBRDashboard {

	public static void main(String[] args) {
		SpringApplication.run(MBRDashboard.class, args);
		
	}

}

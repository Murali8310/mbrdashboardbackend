package com.titan.MBRDashboard.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.titan.MBRDashboard.dto.MonthlyDataFilter;

@RestController
@ComponentScan
@RequestMapping("/dashboard")
public class DashboardController {
	
	@Autowired
	private DashboardService dashboardService;
	private static final Logger logger = LoggerFactory.getLogger(DashboardController.class);

	@PostMapping(path = "/api/MonthlyToalOrdaring", produces = "application/json")
	public ResponseEntity<?> monthlyToalOrdaringData(@RequestBody MonthlyDataFilter filter) {
		try {
			List<Object> result = 
			return new ResponseEntity<Object>(bodyParts, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(this.getClass() + " : save Event Management Permit : " + e.getMessage());
			return new ResponseEntity<RestError>(new RestError(e.getMessage()), HttpStatus.BAD_REQUEST);
		}
	}
	
	
}

package com.titan.MBRDashboard.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.titan.MBRDashboard.dao.DashboardDao;
import com.titan.MBRDashboard.service.DashboardService;




public class DashboardServiceImpl implements DashboardService{
	@Autowired
	private DashboardDao dashboardDao;
	@Override
	public List<Object> monthlyToalOrdaringData() {
		// TODO Auto-generated method stub
		return dashboardDao.monthlyToalOrdaringData();
	}
}

	

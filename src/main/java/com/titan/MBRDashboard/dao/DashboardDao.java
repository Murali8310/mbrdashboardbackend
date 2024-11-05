package com.titan.MBRDashboard.dao;

import java.util.List;

import com.titan.MBRDashboard.dto.MasterData;

public interface DashboardDao {

	List<Object> monthlyToalOrdaringData();

	MasterData GetMasterData();

}

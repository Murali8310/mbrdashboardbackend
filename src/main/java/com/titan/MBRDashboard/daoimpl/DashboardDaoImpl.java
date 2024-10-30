package com.titan.MBRDashboard.daoimpl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import com.titan.MBRDashboard.dao.DashboardDao;

public class DashboardDaoImpl implements DashboardDao {
	@PersistenceContext
	private EntityManager em;

	@SuppressWarnings("unchecked")
	@Override
	public List<Object> monthlyToalOrdaringData() {
		// TODO Auto-generated method stub
		List<Object> result = null;
		try {
			result = em.createNativeQuery(
				    "SELECT " +
				    	    "    MONTH(OrderDate) AS OrderMonth, " +
				    	    "    SUM(OrderQty) AS TotalOrderQty, " +
				    	    "    SUM(TotalPrice) AS TotalRevenue, " +
				    	    "    COUNT(DISTINCT RetailerCode) AS DistinctRetailerCount " +
				    	    "FROM " +
				    	    "    MBROrders " +
				    	    "GROUP BY " +
				    	    "    MONTH(OrderDate) " +
				    	    "ORDER BY " +
				    	    "    OrderMonth"
				    	).getResultList();

			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}

package ro.mylogo.service;

import java.util.List;

import ro.mylogo.model.Commission;


public interface CommissionService {
	
	Commission findById(int id);
	
	Commission findByOrderName(String orderName);
	
	void saveCommission(Commission commission);
	
	void updateCommission(Commission commission);
	
	void deleteByOrderName(String orderName);

	List<Commission> findAllCommissions(); 
	
	boolean isUserOrderNameUnique(Integer id, String orderName);

}

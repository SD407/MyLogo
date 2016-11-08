package ro.mylogo.dao;

import java.util.List;

import ro.mylogo.model.Commission;

public interface CommissionDAO {
	
	Commission findById(int id);
	
	Commission findByOrderName(String orderName);
	
	void save(Commission commission);
	
	void deleteByOrderName(String orderName);
	
	List<Commission> findAllCommissions();

}

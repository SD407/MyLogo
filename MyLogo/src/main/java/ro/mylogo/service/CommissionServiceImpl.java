package ro.mylogo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ro.mylogo.dao.CommissionDAO;
import ro.mylogo.model.Commission;

@Service("commissionService")
@Transactional
public class CommissionServiceImpl implements CommissionService {
	
	@Autowired
	private CommissionDAO commissionDAO;

	@Override
	public Commission findById(int id) {
		return commissionDAO.findById(id);
	}

	@Override
	public Commission findByOrderName(String orderName) {
		Commission commission = commissionDAO.findByOrderName(orderName);
		return commission;
	}

	@Override
	public void saveCommission(Commission commission) {
		commissionDAO.save(commission);
	}

	@Override
	public void updateCommission(Commission commission) {
		Commission entity = commissionDAO.findById(commission.getId());
		if(entity!=null){
			entity.setOrderName(commission.getOrderName());
			entity.setOrderDetails(commission.getOrderDetails());
			entity.setOrderStatus(commission.getOrderStatus());
		}
	}

	@Override
	public void deleteByOrderName(String orderName) {
		commissionDAO.deleteByOrderName(orderName);
	}

	@Override
	public List<Commission> findAllCommissions() {
		return commissionDAO.findAllCommissions();
	}

	@Override
	public boolean isUserOrderNameUnique(Integer id, String orderName) {
		Commission commission = findByOrderName(orderName);
		return ( commission == null || ((id != null) && (commission.getId() == id)));
	}

}

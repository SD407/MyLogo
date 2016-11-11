package ro.mylogo.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import ro.mylogo.model.UserRole;

@Repository("userRoleDAO")
@Transactional
public class UserRoleDAOImpl extends AbstractDAOImpl<Integer, UserRole>implements UserRoleDAO{

	public UserRole findById(int id) {
		return getByKey(id);
	}

	public UserRole findByRole(String role) {
		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("role", role));
		return (UserRole) crit.uniqueResult();
	}
	
	@SuppressWarnings("unchecked")
	public List<UserRole> findAll(){
		Criteria crit = createEntityCriteria();
		crit.addOrder(Order.asc("role"));
		return (List<UserRole>)crit.list();
	}
	
}

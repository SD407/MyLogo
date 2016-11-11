package ro.mylogo.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import ro.mylogo.model.Commission;

@Repository("commissionDAO")
public class CommissionDAOImpl extends AbstractDAOImpl<Integer, Commission> implements CommissionDAO {
	
	static final Logger logger = LoggerFactory.getLogger(UserDAOImpl.class);

	@Override
	public Commission findById(int id) {
		return getByKey(id);
	}
	
	@Override
	public Commission findByOrderName(String orderName) {
		logger.info("ORDERNAME : {}", orderName);
		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("orderName", orderName));
		Commission commission = (Commission)crit.uniqueResult();
		return commission;
	}

	@Override
	public void save(Commission commission) {
		persist(commission);
	}

	@Override
	public void deleteByOrderName(String orderName) {
		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("orderName", orderName));
		Commission commission = (Commission)crit.uniqueResult();
		delete(commission);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Commission> findAllCommissions() {
		Criteria criteria = createEntityCriteria().addOrder(Order.asc("orderName"));
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);//To avoid duplicates.
		List<Commission> commissions = (List<Commission>) criteria.list();
		return commissions;
	}

}

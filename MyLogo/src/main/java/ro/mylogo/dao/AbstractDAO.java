package ro.mylogo.dao;

import java.io.Serializable;

public interface AbstractDAO<PK extends Serializable, T> {
	
	T getByKey(PK key);
	
	void persist(T entity);
	
	void update(T entity);
	
	void delete(T entity);

}

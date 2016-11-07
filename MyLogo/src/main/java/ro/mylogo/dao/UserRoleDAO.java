package ro.mylogo.dao;

import java.util.List;

import ro.mylogo.model.UserRole;


public interface UserRoleDAO {

	List<UserRole> findAll();
	
	UserRole findByRole(String role);
	
	UserRole findById(int id);
}

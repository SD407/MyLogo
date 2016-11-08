package ro.mylogo.service;

import java.util.List;

import ro.mylogo.model.UserRole;

public interface UserRoleService {

	UserRole findById(int id);

	UserRole findByRole(String type);
	
	List<UserRole> findAll();
	
}

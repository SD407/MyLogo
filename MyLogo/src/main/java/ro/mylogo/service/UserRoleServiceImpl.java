package ro.mylogo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ro.mylogo.dao.UserRoleDAO;
import ro.mylogo.model.UserRole;

@Service("userRoleService")
@Transactional
public class UserRoleServiceImpl implements UserRoleService{
	
	@Autowired
	UserRoleDAO dao;
	
	public UserRole findById(int id) {
		return dao.findById(id);
	}

	public UserRole findByRole(String role){
		return dao.findByRole(role);
	}

	public List<UserRole> findAll() {
		return dao.findAll();
	}
}

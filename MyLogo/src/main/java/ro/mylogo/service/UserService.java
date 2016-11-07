package ro.mylogo.service;

import java.util.List;

import ro.mylogo.model.User;

public interface UserService {
	
	User findById(int id);
	
	User findByUsername(String username);
	
	void saveUser(User user);
	
	void updateUser(User user);
	
	void deleteUserByUsername(String sso);

	List<User> findAllUsers(); 
	
	boolean isUserUsernameUnique(Integer id, String sso);

}
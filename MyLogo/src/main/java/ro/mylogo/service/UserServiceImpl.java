package ro.mylogo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ro.mylogo.dao.UserDAO;
import ro.mylogo.model.User;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDAO userDAO;

	@Autowired
    private PasswordEncoder passwordEncoder;
	
	public User findById(int id) {
		return userDAO.findById(id);
	}

	public User findByUsername(String username) {
		User user = userDAO.findByUsername(username);
		return user;
	}

	public void saveUser(User user) {
		user.setPassword(passwordEncoder.encode(user.getPassword()));
		userDAO.save(user);
	}

	/*
	 * Since the method is running with Transaction, No need to call hibernate update explicitly.
	 * Just fetch the entity from db and update it with proper values within transaction.
	 * It will be updated in db once transaction ends. 
	 */
	public void updateUser(User user) {
		User entity = userDAO.findById(user.getId());
		if(entity!=null){
			entity.setUsername(user.getUsername());
			entity.setFirstName(user.getFirstName());
			entity.setLastName(user.getLastName());
			entity.setEmail(user.getEmail());
			entity.setUserRoles(user.getUserRoles());
		}
	}

	
	public void deleteUserByUsername(String username) {
		userDAO.deleteByUsername(username);
	}

	public List<User> findAllUsers() {
		return userDAO.findAllUsers();
	}

	public boolean isUserUsernameUnique(Integer id, String username) {
		User user = findByUsername(username);
		return ( user == null || ((id != null) && (user.getId() == id)));
	}
	
}

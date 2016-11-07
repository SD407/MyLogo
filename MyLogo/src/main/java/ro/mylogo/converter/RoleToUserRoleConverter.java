package ro.mylogo.converter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import ro.mylogo.model.UserRole;
import ro.mylogo.service.UserRoleService;


/**
 * A converter class used in views to map id's to actual userProfile objects.
 */
@Component
public class RoleToUserRoleConverter implements Converter<Object, UserRole>{

	static final Logger logger = LoggerFactory.getLogger(RoleToUserRoleConverter.class);
	
	@Autowired
	UserRoleService userRoleService;

	/**
	 * Gets UserProfile by Id
	 * @see org.springframework.core.convert.converter.Converter#convert(java.lang.Object)
	 */
	public UserRole convert(Object element) {
		Integer id = Integer.parseInt((String)element);
		UserRole profile= userRoleService.findById(id);
		logger.info("Profile : {}",profile);
		return profile;
	}
	
}
package ro.mylogo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationTrustResolver;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/")
@SessionAttributes("roles")
public class WebPageController {
	
	@Autowired
	AuthenticationTrustResolver authenticationTrustResolver;
	
	@RequestMapping(value = "/home")
	public String renderHomePage () throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("loggedinuser", getPrincipal());
		return "home";
	}
	
	@RequestMapping(value = "/about")
	public String renderAboutPage () throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("loggedinuser", getPrincipal());
		return "about";
	}
	
	@RequestMapping(value = "/termsandconditions")
	public String renderTermsAndConditionsPage () throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("loggedinuser", getPrincipal());
		return "termsandconditions";
	}
	
	@RequestMapping(value = "/privacy")
	public String renderPrivacy () throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("loggedinuser", getPrincipal());
		return "privacy";
	}

	/**
	 * This method returns the principal[user-name] of logged-in user.
	 */
	private String getPrincipal(){
		String userName = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
			userName = ((UserDetails)principal).getUsername();
		} else {
			userName = principal.toString();
		}
		return userName;
	}
	
}

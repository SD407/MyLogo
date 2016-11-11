package ro.mylogo.controller;

import java.util.Locale;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.authentication.AuthenticationTrustResolver;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import ro.mylogo.model.Commission;
import ro.mylogo.model.User;
import ro.mylogo.service.CommissionService;
import ro.mylogo.service.UserService;

@Controller
@RequestMapping("/")
@SessionAttributes("roles")
public class CommissionsController {
	
	@Autowired
	AuthenticationTrustResolver authenticationTrustResolver;
	
	@Autowired
	CommissionService commissionService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	MessageSource messageSource;
	
	/**
	 * This method will provide the medium to add a new user.
	 */
	@RequestMapping(value = { "/newcommission" }, method = RequestMethod.GET)
	public String newCommission(ModelMap model) {
		Commission commission = new Commission();
		model.addAttribute("commission", commission);
		model.addAttribute("edit", false);
		model.addAttribute("loggedinuser", getPrincipal());
		return "commissioncreation";
	}

	/**
	 * This method will be called on form submission, handling POST request for
	 * saving commission in the database. It also validates the input
	 */
	@RequestMapping(value = { "/newcommission" }, method = RequestMethod.POST)
	public String saveCommission(@Valid Commission commission, BindingResult result, ModelMap model) {

		if (result.hasErrors()) {
			return "commissioncreation";
		}

		if(!commissionService.isUserOrderNameUnique(commission.getId(), commission.getOrderName())){
			FieldError orderNameError =new FieldError("commission","orderName", 
					messageSource.getMessage("non.unique.orderName", 
							new String[]{commission.getOrderName()}, Locale.getDefault()));
		    result.addError(orderNameError);
			return "commissioncreation";
		}
		
		User user = userService.findByUsername(getPrincipal());
		commission.setUser(user);
		
		commissionService.saveCommission(commission);

		model.addAttribute("success", "Your commission was successfully created.");
		model.addAttribute("loggedinuser", getPrincipal());
		return "commissioncreationsuccess";
	}
	
	/**
	 * This method will provide the medium to update an existing user.
	 */
	@RequestMapping(value = { "/edit-commission-{orderName}" }, method = RequestMethod.GET)
	public String editCommission(@PathVariable String orderName, ModelMap model) {
		Commission commission = commissionService.findByOrderName(orderName);
		model.addAttribute("commission", commission);
		model.addAttribute("edit", true);
		model.addAttribute("{orderName}", orderName);
		model.addAttribute("loggedinuser", getPrincipal());
		return "editcommission";
	}
	
	/**
	 * This method will be called on form submission, handling POST request for
	 * updating user in database. It also validates the user input
	 */
	@RequestMapping(value = { "/edit-commission-{orderName}" }, method = RequestMethod.POST)
	public String updateCommission(@Valid Commission commission, BindingResult result, ModelMap model, @PathVariable String orderName) {

		if (result.hasErrors()) {
			return "commissioncreation";
		}

		if(!commissionService.isUserOrderNameUnique(commission.getId(), commission.getOrderName())){
			FieldError orderNameError =new FieldError("commission","orderName", 
					messageSource.getMessage("non.unique.orderName", 
							new String[]{commission.getOrderName()}, Locale.getDefault()));
		    result.addError(orderNameError);
			return "commissioncreation";
		}

		commissionService.updateCommission(commission);

		model.addAttribute("success",  "Your commission was updated successfully.");
		model.addAttribute("loggedinuser", getPrincipal());
		return "commissioncreationsuccess";
	}

	
	/**
	 * This method will delete an user by it's USERNAME value.
	 */
	@RequestMapping(value = { "/delete-commission-{orderName}" }, method = RequestMethod.GET)
	public String deleteCommission(@PathVariable String orderName) {
		commissionService.deleteByOrderName(orderName);
		return "redirect:/list";
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

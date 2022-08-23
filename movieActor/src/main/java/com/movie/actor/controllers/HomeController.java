package com.movie.actor.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;


import com.movie.actor.models.LoginUser;
import com.movie.actor.models.User;
import com.movie.actor.services.UserService;


@Controller
public class HomeController {
	@Autowired 
	private HttpSession session;
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/")
	public String index(Model model) {
        // Bind empty User and LoginUser objects to the JSP
        // to capture the form input
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		//return to index page
		return "index.jsp";
	}
	
	@PostMapping("/register")//we need valid for Post
	public String registerUser(@Valid @ModelAttribute("newUser") User regUser, BindingResult regResult, Model model){
		User user = userService.register(regUser, regResult);
		//for post need to check errors
		if(regResult.hasErrors()) {
			// Be sure to send in the empty LoginUser before 
            // re-rendering the page.
			model.addAttribute("newLogin", new LoginUser());
			return "index.jsp";
		}//Store their ID from the DB in session,
		session.setAttribute("userId", user.getId());
		return "redirect:/movies";
	}
	
    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
            BindingResult result, Model model) {
        
        // Add once service is implemented:
         User user = userService.login(newLogin, result);
    
        if(result.hasErrors()|| user==null) {
            model.addAttribute("newUser", new User());
            return "index.jsp";
        }
        // No errors! 
        // TO-DO Later: Store their ID from the DB in session, 
        session.setAttribute("userId", user.getId());
        return "redirect:/movies";
    }
	
// add a logout route
	@GetMapping("/logout")
	public String logout() {
		session.invalidate();
		return "redirect:/";
	}	
	
}

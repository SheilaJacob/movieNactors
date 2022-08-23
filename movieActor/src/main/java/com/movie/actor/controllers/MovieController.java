package com.movie.actor.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.movie.actor.models.Movie;
import com.movie.actor.services.MovieService;
import com.movie.actor.services.UserService;



@Controller
public class MovieController {
	@Autowired
	private HttpSession session;
	@Autowired 
	private MovieService movieService;
	@Autowired
	private UserService userService;

	
	@GetMapping("/movies")//to enter in the dashboard
	public String home(Model dashB) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
		}//main page display movies and user name
		Long userId = (Long) session.getAttribute("userId");//this shows whos online (welcome sheila		
		dashB.addAttribute("user", userService.findById(userId));//(welcome sheila)
		dashB.addAttribute("allmovies", movieService.getAllMovies());//getAllMovies is in the service page
	//REMEMBER TO IMPORT THE AUTOWIRED SERVICE 
		return "dashboard.jsp";
	}
	
//	Check if user is in session for all get routes
	//Add new movie Get and Post
	@GetMapping("/movies/new")
	public String newBelt(Model newM) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		newM.addAttribute("newMM", new Movie());
		newM.addAttribute("sessionId", session.getAttribute("userId"));
		return "add.jsp";
	}
	@PostMapping("/movies/add")//for POST we need to add valid
	public String addBelt(@Valid @ModelAttribute("newMM") Movie newMovie, BindingResult results) {
		if(results.hasErrors()) {
			return "add.jsp";
		}
		movieService.saveMovie(newMovie);
		return "redirect:/movies";
	}
		

	//view details of movie 
	@GetMapping("/movie/{id}")
	public String view(@PathVariable("id") Long id, Model model) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		model.addAttribute("mov", movieService.getById(id));
		model.addAttribute("userId", session.getAttribute("userId"));
		return "details.jsp";
	}
	
	
	//EDIT AND UPDATE
	//edit and update below 
	@GetMapping("/movies/edit/{id}")
	public String edit(@PathVariable("id") Long id, Model edit) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		Movie editMovie = movieService.getById(id);
		edit.addAttribute("mov", editMovie);
		return "edit.jsp";
	}
	@PutMapping("/movies/update/{id}")
	public String update(@Valid @ModelAttribute("mov") Movie movie, BindingResult update) {
		if(update.hasErrors()) {
			return "edit.jsp";
		}
		movieService.updateM(movie);
		return "redirect:/movies";
	}
	
	
	//delete with flash message
	@GetMapping("/delete/{id}")
	public String delete(@PathVariable Long id) {
		if(session.getAttribute("userId") == null){
			return "redirect:/";
		}
		this.movieService.delete(id);
		return "redirect:/movies";
	}
}

package com.movie.actor.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.movie.actor.models.Movie;
import com.movie.actor.repositories.MovieRepository;


@Service
public class MovieService {
	
	@Autowired
	MovieRepository movieRepo;
	
	//list all movies
	public List<Movie> getAllMovies(){//the get all is being called in the first / on dashboard 
		return movieRepo.findAll();
	}
	// Get one by ID
	public Movie getById(Long id) {
		return movieRepo.findById(id).orElse(null);
	}
	// create new 
	public Movie saveMovie(Movie movie) {
		return movieRepo.save(movie);
	}
	
	//edit and update
	public Movie updateM(Movie movie) {
		return movieRepo.save(movie);

	}
	
	// Delete a Project
	public void delete(Long id) {
		movieRepo.deleteById(id);
	}
}

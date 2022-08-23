package com.movie.actor.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.movie.actor.models.Movie;
import com.movie.actor.models.User;



@Repository
public interface MovieRepository extends CrudRepository<Movie, Long> {
	List<Movie> findAll();
	List<Movie> findAllByUser(User user);
}

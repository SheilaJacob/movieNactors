package com.movie.actor.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.movie.actor.models.LoginUser;
import com.movie.actor.models.User;
import com.movie.actor.repositories.UserRepository;



@Service
public class UserService {
	
	@Autowired
	private UserRepository uRepo;
	
	
	
	// Register
    public User register(User newUser, BindingResult show) {
        //attach the info from the repo for the email
    	Optional<User> futureUser = uRepo.findByEmail(newUser.getEmail());
    	 // Reject if password doesn't match confirmation, getConfirm is from model User
    	if(!newUser.getPassword().equals(newUser.getConfirm())) {
    		show.rejectValue("confirm", "Matches", "Password must match Password!");
    	}
    	// Email - duplicate
    	if(futureUser.isPresent()) {
    		show.rejectValue("email", "Matches", "An account with that email already exists!");
    	}
    	// Return null if result has errors
    	if(show.hasErrors()) {
    		return null;
    	}
    
        // Hash and set password, save user to database
 
    	String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
    	newUser.setPassword(hashed);
    	return uRepo.save(newUser);
    }
    
    
	public User findById(Long id) {
    	Optional<User> futureUser = uRepo.findById(id);
    	if(futureUser.isPresent()) {
    		return futureUser.get();
    	}
    	return null;
    }
	
	//Login method
    public User login(LoginUser newLogin, BindingResult logResult) {
    	Optional<User> logUser = uRepo.findByEmail(newLogin.getEmail());
    	// Find user in the DB by email
        // Reject if NOT present
    	if(!logUser.isPresent()) {
    		logResult.rejectValue("email", "Matches", "User not found!");
    		return null;
    	}
    	// User exists, retrieve user from DB
    	User user = logUser.get();
        // Reject if BCrypt password match fails
    	if(!BCrypt.checkpw(newLogin.getPassword(), user.getPassword())) {
    	    logResult.rejectValue("password", "Matches", "Invalid Password!");
    	}
    	// Return null if result has errors
    	if(logResult.hasErrors()) {
    		return null;
    	}
        // Otherwise, return the user object
        return user;
    }
    

	
	
	
}

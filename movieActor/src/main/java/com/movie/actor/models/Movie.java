package com.movie.actor.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Future;
import javax.validation.constraints.NotEmpty;

import org.springframework.format.annotation.DateTimeFormat;



@Entity
@Table(name="movies")
public class Movie {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	
	
	private Long id;
	@NotEmpty(message="Enter Title Please!")
	
	private String name;
	@NotEmpty(message="please enter actor!")
	private String actor;
	
	@NotEmpty(message="We need your thoughts!")
	private String comment;	
	
    @Future
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date dueDate;//thats what is going in the html page
    
    
	@Column(updatable=false)
	private Date createdAt;
	private Date updatedAt;
	//need a many to one, and the join column is the user 
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="postedBy")
	private User user;
	
	public Movie() {}

	public Movie(Long id, String name, String actor,String comment, Date createdAt, Date updatedAt, User user) {
		this.id = id;
		this.name = name;
		this.actor = actor;
		this.comment = comment;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
		this.user = user;
	}

//Get and Set
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getActor() {
		return actor;
	}

	public void setActor(String actor) {
		this.actor = actor;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Date getDueDate() {
		return dueDate;
	}

	public void setDueDate(Date dueDate) {
		this.dueDate = dueDate;
	}
	
    @PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }

	
	
}

package com.assessment.project.dao;

import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotNull;

@Entity
@Table(name = "users")
public class Users {

	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	private Long userId;
	@NotNull
	@Column(name = "user_name")
	private String userName;
	@NotNull
	@Column(name = "user_email")
	private String userEmail;
	@NotNull
	@Column(name = "user_password")
	private String userPassword;
	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name = "user_role", 
				joinColumns = @JoinColumn (name = "user_id"), 
				inverseJoinColumns =  @JoinColumn(name = "role_id"))
	private Set<Roles> roles = new HashSet<>();
	public Users() {
		
	}
	public Users(String userEmail, String userPassword) {
		this.userEmail = userEmail;
		this.userPassword = userPassword;
	}
	public Users(String userEmail, String userPassword, Set<Roles> roles) {
		this.userEmail = userEmail;
		this.userPassword = userPassword;
		this.roles = roles;
	}
	public Users(String userName, String userEmail, String userPassword, Set<Roles> roles) {
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPassword = userPassword;
		this.roles = roles;
	}
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public Set<Roles> getRoles() {
		return roles;
	}
	public void setRoles(Set<Roles> roles) {
		this.roles = roles;
	}
	@Override
	public boolean equals(Object obj) {
		if(this == obj) return true;
		if(obj == null || getClass() != obj.getClass()) return false;
		Users user = (Users) obj;
		return userName.equals(user.userName) && userEmail.equals(user.userEmail) && userPassword.equals(user.userPassword);
	}
	@Override
	public int hashCode() {
		return Objects.hash(userName, userEmail, userPassword);
	}
}

package com.assessment.project.dao;

import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotNull;

@Entity
@Table(name = "roles")
public class Roles {

	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	private Long roleId;
	@NotNull
	@Column(name = "role_name")
	private String roleName;
	@NotNull
	@Column(name = "role_description")
	private String roleDescription;
	@ManyToMany(mappedBy = "roles")
	private Set<Users> user = new HashSet<>();
	public Long getRoleId() {
		return roleId;
	}
	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getRoleDescription() {
		return roleDescription;
	}
	public void setRoleDescription(String roleDescription) {
		this.roleDescription = roleDescription;
	}
	public Set<Users> getUser() {
		return user;
	}
	public void setUser(Set<Users> user) {
		this.user = user;
	}
	@Override
	public boolean equals(Object obj) {
		if(this == obj) return true;
		if(obj == null || getClass() != obj.getClass()) return false;
		Roles roles = (Roles) obj;
		return roleName.equals(roles.roleName);
	}
	@Override
	public int hashCode() {
		return Objects.hash(roleName);
	}
}

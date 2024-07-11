package com.assessment.project.repository;

import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.assessment.project.dao.Roles;

@Repository
public interface RoleRepository extends JpaRepository<Roles, Long>{

		@Query("SELECT r FROM Roles r WHERE r.roleName in:roles")
		Set<Roles> findBySpecificRoles(@Param("roles")String roles);
}

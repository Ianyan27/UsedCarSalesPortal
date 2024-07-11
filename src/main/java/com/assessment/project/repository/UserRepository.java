package com.assessment.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.assessment.project.dao.Users;

@Repository
public interface UserRepository extends JpaRepository<Users, Long>{
	public Users findByUserEmail(String userEmail);
	
	@Query(value = "SELECT e FROM Users e WHERE e.userEmail LIKE '%' || :search_acc || '%'")
	public List<Users> searchByUserEmail(@Param("search_acc") String search_acc);
	
	Users getByUserName(String userName);
}

package com.assessment.project.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.assessment.project.dao.Users;

@Service
public interface CreateAccountService {
	public void saveAccount(Users user);
	public List<Users> listAll();
	public Users getByUserId(Long userId);
	public void deleteById(Long userId);
	public List<Users> searchByUserEmail(String userEmail);
	public Users getUserName(String userName);
}

package com.assessment.project.services;

import java.util.HashSet;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.assessment.project.dao.Users;
import com.assessment.project.repository.RoleRepository;
import com.assessment.project.repository.UserRepository;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class CreateAccountServiceImplementaion implements CreateAccountService{

	@Autowired
	private RoleRepository roleRepo;
	@Autowired
	private UserRepository userRepo;
	@Override
	public void saveAccount(Users user) {
		user.setRoles(new HashSet<>(roleRepo.findBySpecificRoles("USER")));
		userRepo.save(user);
	}

	@Override
	public List<Users> listAll() {
		return (List<Users>) userRepo.findAll();
	}

	@Override
	public Users getByUserId(Long userId) {
		return userRepo.findById(userId).get();
	}

	@Override
	public void deleteById(Long userId) {
		userRepo.deleteById(userId);
	}

	@Override
	public List<Users> searchByUserEmail(String userEmail) {
		return userRepo.searchByUserEmail(userEmail);
	}

	@Override
	public Users getUserName(String userName) {
		return userRepo.getByUserName(userName);
	}
}

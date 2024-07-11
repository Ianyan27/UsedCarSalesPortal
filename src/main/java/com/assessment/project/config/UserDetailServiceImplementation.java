package com.assessment.project.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.core.userdetails.User.UserBuilder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.assessment.project.dao.Roles;
import com.assessment.project.dao.Users;
import com.assessment.project.repository.UserRepository;

@Service
public class UserDetailServiceImplementation implements UserDetailsService{

	@Autowired
	private UserRepository userRepo;
	@Autowired
	private PasswordEncoder passwordEncoder;
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Users user = userRepo.findByUserEmail(username);
		System.out.println("this is from user detail "+ username);
		if(user == null) {
			throw new UsernameNotFoundException("Please use another account");
		}
		UserBuilder userBuilder = org.springframework.security.core.userdetails.User.builder();
		String[] roleNames = user.getRoles().stream().map(Roles::getRoleName).toArray(String[]::new);
		System.out.println(user.getUserName());
		return userBuilder.username(user.getUserEmail())
							.password(user.getUserPassword())
							.roles(roleNames)
							.passwordEncoder(passwordEncoder::encode)
							.build();
	}

}

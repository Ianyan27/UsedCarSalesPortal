package com.assessment.project.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
public class SecurityConfig {


	@Bean
	PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	@Bean
	SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
	http
		.csrf(
				csrf -> csrf.disable()
				)
				.authorizeRequests(auth -> {
					auth.requestMatchers("/").permitAll();
					auth.requestMatchers("/login").permitAll();
					auth.requestMatchers("/create_account").permitAll();
					auth.requestMatchers("/home").permitAll();
					auth.requestMatchers("/post_cars").hasAnyRole("USER", "ADMIN");
					auth.requestMatchers("/view_cars").hasAnyRole("USER", "ADMIN");
					auth.requestMatchers("/edit_cars").hasAnyRole("USER", "ADMIN");
					auth.requestMatchers("/bid_car").hasAnyRole("USER", "ADMIN");
					auth.requestMatchers("/bid_cars").hasAnyRole("USER", "ADMIN");
					auth.requestMatchers("/search").hasAnyRole("USER", "ADMIN");
					auth.requestMatchers("/registered_accounts").hasRole("ADMIN");
				})
		.formLogin(
				form -> form
					.loginPage("/login")
					.loginProcessingUrl("/login")
					.failureUrl("/login_error")
					.defaultSuccessUrl("/home")
					.permitAll()
			)
		.logout(
				logout -> logout
				.logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
				.logoutSuccessUrl("/login")
				.permitAll()
			);
	return http.build();
	}
}

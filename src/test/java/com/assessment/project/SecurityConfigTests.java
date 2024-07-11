package com.assessment.project;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;

@SpringBootTest
@AutoConfigureMockMvc
public class SecurityConfigTests {

	@Autowired
	private MockMvc mockMvc;
	//testing permitted pages for unregistered users
	@Test
	public void testPermittedPages() throws Exception{
		mockMvc.perform(MockMvcRequestBuilders.get("/"))
		.andExpect(MockMvcResultMatchers.status().isOk());
	}
	//testing user account authorization
	@Test
	public void testAccessToSecuredPages() throws Exception{
		mockMvc.perform(MockMvcRequestBuilders.get("/post_cars")
				.with(SecurityMockMvcRequestPostProcessors.user("user")
						.roles("USER"))).andExpect(MockMvcResultMatchers.status().isOk());
	}
	
	@Test
	public void testAuthorizedPages() throws Exception{
		mockMvc.perform(MockMvcRequestBuilders.get("/post_cars")
				.with(SecurityMockMvcRequestPostProcessors.user("user").roles("USER")))
				.andExpect(MockMvcResultMatchers.status().isOk());
		mockMvc.perform(MockMvcRequestBuilders.get("/registered_accounts")
				.with(SecurityMockMvcRequestPostProcessors.user("admin").roles("ADMIN")))
				.andExpect(MockMvcResultMatchers.status().isOk());
	}
	//testing if the user will be redirected to the login page if they want to access something inside the website
	@Test
	public void testRedirectPages() throws Exception {
		mockMvc.perform(MockMvcRequestBuilders.get("/post_cars"))
		.andExpect(MockMvcResultMatchers.redirectedUrl("http://localhost/login"));
	}
	//testing login
	@Test
	public void testLogin() throws Exception{
		mockMvc.perform(MockMvcRequestBuilders.post("/login")
				.param("username", "Admin@gmail.com").param("password", "adminaccount"))
					.andExpect(MockMvcResultMatchers.redirectedUrl("/home"));
	}
	//testing logout
	@Test
	public void testLogout() throws Exception{
		mockMvc.perform(MockMvcRequestBuilders.post("/logout"))
			.andExpect(MockMvcResultMatchers.redirectedUrl("/login"));
	}
}

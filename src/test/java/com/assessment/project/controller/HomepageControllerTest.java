package com.assessment.project.controller;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
@RunWith(SpringRunner.class)
@SpringBootTest
class HomepageControllerTest {


	@Test
	void returnLoginPage() {
		LoginController loginContr= new LoginController();
		assertEquals("login_page", loginContr.login());
	}
}

package com.wiezon.test;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class TestController {
	
	@Autowired
	private TestService testService;
	
	@RequestMapping("/test")
	public String test(
			@RequestParam(required=false, defaultValue = "0") String id,
			@RequestParam(required=false, defaultValue = "1") String password,
			Model model) {
		List<Test> test = testService.getUserInfo(id, password);
		model.addAttribute("test",test);

		
		return "test";
	}
}

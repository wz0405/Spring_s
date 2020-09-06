package com.wiezon.test;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class DataController {

	@Autowired
	private DataService dataService;

	@RequestMapping("/ship")
	public String goHome() {
		return "html/main";
	}

	@RequestMapping("/control-1")
	public String goControl_01(Model model, 
			@RequestParam(required=false, defaultValue = "0")String no, 
			@RequestParam(required=false, defaultValue = "0")String date, 
			@RequestParam(required=false, defaultValue = "0")String balsang, 
			@RequestParam(required=false, defaultValue = "0")String balgu, 
			@RequestParam(required=false, defaultValue = "0")String volt,
			@RequestParam(required=false, defaultValue = "0")String arm, 
			@RequestParam(required=false, defaultValue = "0")String power, 
			@RequestParam(required=false, defaultValue = "0")String energyGye, 
			@RequestParam(required=false, defaultValue = "0")String energyNu) {

		List<Data> data = dataService.getDataInfo(no, date, balsang, balgu, volt, arm, power, energyGye, energyNu);
		model.addAttribute("data", data);
		return "html/control-01";
	}

	@RequestMapping("/control-2")
	public String goControl_02() {
		return "html/control-02";
	}

	@RequestMapping("/operation")
	public String goOperation() {
		return "html/operation";
	}

	@RequestMapping("/statistic")
	public String goStatistic() {
		return "html/statistic";
	}

}

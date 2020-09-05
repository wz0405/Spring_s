package spring.mvc.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ShipController {
	@RequestMapping("/ship")
	public String goHome() {
		return "html/main";
	}

	@RequestMapping("/control-1")
	public String goControl_01() {
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

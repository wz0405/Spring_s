package spring.day0626.ex1;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class ScoreController {
	@GetMapping("score")
	public String form2() {
		return "form2";
	}

	@PostMapping("/action")
	public ModelAndView read2(@ModelAttribute ScoreDTO dto) {
		ModelAndView model = new ModelAndView();
		// dto로 request
		model.addObject("dto", dto);

		// 포워드
		model.setViewName("process5");
		return model;
	}
}

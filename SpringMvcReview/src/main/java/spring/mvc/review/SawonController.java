package spring.mvc.review;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller("sawon")
public class SawonController {
    //@PostMapping(value="/",method=RequestMethod.POST) //시작화면이 루트
    @GetMapping("sawon")
    public String sawonForm() {
        return "sawonForm";
    }

    @PostMapping("/action")
    public ModelAndView read2(@ModelAttribute SawonDTO dto) {
        ModelAndView model = new ModelAndView();
        //dto로 request
        model.addObject("dto", dto);


        //포워드
        model.setViewName("sawonInfo");
        return model;

    }
}

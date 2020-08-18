package spring.day0626.ex1;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller //컴포넌트 역할 수행
public class HelloController {

    @RequestMapping(value = "/happy", method = RequestMethod.GET) //happy로 매핑주소 설정
    public String hello(Model model) {  //모델은 request만 담당
        //서블릿에서 코딩했던 request.setAttribute와 같다.
        //Model은 request에서 데이타를 저장하기 위한 인터페이스
        model.addAttribute("name", "한현희");
        model.addAttribute("addr", "서울구로");
        return "result"; //포워드(Web-INF/day0626/result.jsp) 
    }

    //@GetMapping("/hello.do") //매핑주소 변경(주소창에 뜸)
    @RequestMapping(value = "/hello", method = RequestMethod.GET)
    public ModelAndView hello2() {
        ModelAndView model = new ModelAndView();
        //모델에 데이타 저장
        model.addObject("sangpum", "딸기");
        model.addObject("price", 10000);

        //jsp로 포워드
        model.setViewName("result2");
        return model;
    }


}

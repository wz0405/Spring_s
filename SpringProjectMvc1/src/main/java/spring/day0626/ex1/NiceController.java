package spring.day0626.ex1;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class NiceController implements Controller { //컨트롤러 인터페이스 상속
    @Override
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

        ModelAndView model = new ModelAndView();
        model.addObject("today", new Date());
        model.addObject("weather", "아주맑음");
        model.setViewName("result3");
        return model;
    }
}

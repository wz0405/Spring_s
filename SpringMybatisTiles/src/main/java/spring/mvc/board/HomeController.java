package spring.mvc.board;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import info.data.InfoDaoInter;
import info.data.InfoDto;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
    @Autowired
    private InfoDaoInter dao;

    // index에서 설정한 매핑주소 home
    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String home(Locale locale, Model model) {

        return "home.tiles"; // jsp주소를 tiles의 value값으로 설정
    }

    @GetMapping("/info/list")
    public ModelAndView list() {
        ModelAndView model = new ModelAndView();
        List<InfoDto> list = dao.getAllDatas();
        model.addObject("list", list);
        model.setViewName("/info/list");
        return model;
    }

    @RequestMapping(value = "/insertform", method = {RequestMethod.GET, RequestMethod.POST})
    public String insertform() {
        return "info/insertForm";
    }

    @PostMapping("info/write") //폼의 액션과 일치
    public String insert(@ModelAttribute InfoDto dto) {
        dao.insertInfo(dto);
        return "redirect:list";
    }

    //	public String listview() {
//
//		//return "list.tiles";
//		return "/info/list";
//	}
    @GetMapping("/info/insertform")
    public String inputform() {

        //return "input.tiles"; 
        return "/info/inputForm";
    }

    // 메뉴 에서 설정한 매핑주소

}

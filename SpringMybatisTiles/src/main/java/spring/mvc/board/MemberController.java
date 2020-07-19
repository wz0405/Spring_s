package spring.mvc.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import member.data.MemberDaoInter;
import member.data.MemberDto;

@Controller
public class MemberController {
    @Autowired
    MemberDaoInter dao;

    @GetMapping("/member/list")
    public ModelAndView list() {
        ModelAndView model = new ModelAndView();
        List<MemberDto> list = dao.getAllDatas();
        model.addObject("list", list);
        model.addObject("cnt", list.size());
        model.setViewName("/member/memberList");
        return model;

    }

    @GetMapping("/member/insertform")
    public String memberform() {
        return "/member/memberForm";
    }

    @PostMapping("/member/insert")
    public String insert(@ModelAttribute MemberDto dto) {
        dao.insertMember(dto);
        return "redirect:list";
    }

    @RequestMapping(value = "/member/updateform", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView updateform(@RequestParam String num) {
        ModelAndView model = new ModelAndView();
        MemberDto dto = dao.getData(num);
        model.addObject("dto", dto);
        model.setViewName("/member/updateForm");
        return model;
    }

    @PostMapping("/member/update")
    public String update(@ModelAttribute MemberDto dto) {
        dao.updateMember(dto);
        return "redirect:list";
    }

    @RequestMapping(value = "/member/delete", method = {RequestMethod.GET, RequestMethod.POST})
    public String delete(@ModelAttribute MemberDto dto) {
        dao.deleteMember(dto);
        return "redirect:list";
    }
}

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

import person.data.PersonDao;
import person.data.PersonDto;

@Controller
public class PersonController {
	@Autowired
	PersonDao dao;

	@GetMapping("/person/list")
	public ModelAndView list() {
		ModelAndView model = new ModelAndView();
		// dao에서 전체 데이터를 db로 부터 가져온다.
		List<PersonDto> list = dao.getAllDatas();
		// request의 list를 추가한다.
		model.addObject("list", list);
		model.addObject("cnt", list.size());
		// 포워드할 jsp를 지정한다.
		model.setViewName("person/personList");
		return model;
	}

	// 자료 입력하기 버튼을 누르면 폼이 나오게
	@GetMapping("/person/personform")
	public String inputform() {
		return "person/personForm";
	}

	@GetMapping("/person/insert") // 폼의 액션과 일치
	public String insert(@ModelAttribute PersonDto dto) {
		dao.insertPerson(dto);
		return "redirect:list";
	}

	// 수정버튼을 누르면 수정하려는 사람의 데이터가 보인다.
	@GetMapping("/person/updateform")
	public ModelAndView updateform(@RequestParam String num) {
		ModelAndView model = new ModelAndView();
		PersonDto dto = dao.getData(num);
		model.addObject("dto", dto);
		model.setViewName("person/updateForm");
		return model;
	}

	@RequestMapping(value = "/person/update", method = { RequestMethod.GET, RequestMethod.POST })
	public String update(@ModelAttribute PersonDto dto) {
		dao.updatePerson(dto);
		return "redirect:list";
	}

	@RequestMapping(value = "/person/delete", method = { RequestMethod.GET, RequestMethod.POST })
	public String delete(@ModelAttribute PersonDto dto) {
		dao.deletePerson(dto);
		return "redirect:list";
	}
}

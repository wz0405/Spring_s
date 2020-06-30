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

import board.data.BoardDaoInter;
import board.data.BoardDto;

@Controller
public class BoardController {

	@Autowired
	private BoardDaoInter dao;
	
	@GetMapping("/list")  //index시작경로와 같다
	public ModelAndView list()
	{
		ModelAndView model=new ModelAndView();
		int totalCount=dao.getTotalCount();
		List<BoardDto> list=dao.getAllDatas();
		model.addObject("totalCount", totalCount);
		model.addObject("list", list);
		model.setViewName("board/list");
		return model;
	}
	//폼에 입력시 insert되는 페이지 
	@PostMapping("/write") //폼의 액션과 일치
	public String insert(@ModelAttribute BoardDto dto)
	{
		dao.insertBoard(dto);
		return "redirect:list"; 
	}
	//리스트의 글쓰기 버튼을 클릭했을 떄 폼이 나오도록 매핑처리
	
	@RequestMapping(value="/writeform" , method = {RequestMethod.GET, RequestMethod.POST})
	public String writeform() {
		return "board/writeForm";
	}
	//리스트에서 제목을 누르면 content로 연결되도록 매핑
	@GetMapping("/content") //리스트의 제목에 a태그로 연결되어 있음
	public ModelAndView content(@RequestParam String num) {
		ModelAndView model= new ModelAndView();
		BoardDto dto=dao.getData(num);
		model.addObject("dto", dto);
		model.setViewName("board/content");
		return model;
	}
	
	//수정버튼을 누르면 수정하려는 사람의 데이터가 보인다.
	@GetMapping("/updateform")
	public ModelAndView updateform(@RequestParam String num) {
		ModelAndView model = new ModelAndView();
		BoardDto dto=dao.getData(num);
		model.addObject("dto",dto);
		model.setViewName("board/updateForm");
		return model;
	}
	@PostMapping("/update")
	public String update(@ModelAttribute BoardDto dto) {
		dao.updateBoard(dto);
		return "redirect:list";
	}
	@RequestMapping(value="/delete" , method = {RequestMethod.GET, RequestMethod.POST})
	public String delete(@ModelAttribute BoardDto dto) {
		dao.deleteBoard(dto);
		return "redirect:list";
	}
}

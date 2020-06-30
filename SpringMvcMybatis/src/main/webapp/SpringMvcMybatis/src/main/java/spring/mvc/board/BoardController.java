package spring.mvc.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
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
	
	@PostMapping("/write")
	public String insert(@ModelAttribute BoardDto dto)
	{
		dao.insertBoard(dto);
		return "redirect:list"; 
	}
}

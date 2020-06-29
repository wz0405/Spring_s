package spring.mvc.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import board.data.BoardDaoInter;

@Controller
public class BoardController {

	@Autowired
	private BoardDaoInter dao;
	
	@GetMapping("/list")  //index시작경로와 같다
	public ModelAndView list()
	{
		ModelAndView model=new ModelAndView();
		int totalCount=dao.getTotalCount();
		model.addObject("totalCount", totalCount);
		model.setViewName("board/list");
		return model;
	}
}


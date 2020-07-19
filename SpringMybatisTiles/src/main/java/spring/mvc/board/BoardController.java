package spring.mvc.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import board.data.BoardDaoInter;
import board.data.BoardDto;


@Controller
public class BoardController {

    @Autowired
    BoardDaoInter dao;

    // 게시판출력
    @GetMapping("/board/list") // 메뉴에서 시작하니 매핑주소 맞출것
    public ModelAndView list(@RequestParam(value = "pageNum", defaultValue = "1") int currentPage) {
        ModelAndView model = new ModelAndView();
        int totalCount = dao.getTotalCount();
        // 페이징처리에 필요한 변수
        int totalPage; // 총 페이지수
        int startNum; // 각페이지의 시작번호
        int endNum; // 각페이지의 끝번호
        int startPage; // 블럭의 시작페이지
        int endPage; // 블럭의 끝페이지
        int no; // 출력할 시작번호
        int perPage = 5; // 한페이지당 보여질 글의 갯수
        int perBlock = 5;// 한블럭당 보여질 페이지의 개수

        // 총 페이지 수를 구한다
        totalPage = totalCount / perPage + (totalCount % perPage > 0 ? 1 : 0);

        // 존재하지 않는 페이지일경우 마지막페이지로 가기
        if (currentPage > totalPage)
            currentPage = totalPage;

        // 각블럭의 시작페이지와 끝페이지구하기
        // perBlock이 5일경우
        // 예: 한페이지가 3일경우 시작페이지 1 끝 5
        // 예: 한페이지가 7일경우 시작페이지 6 끝 10
        // 예: 한페이지가 11일경우 시작페이지 11 끝 15

        startPage = (currentPage - 1) / perBlock * perBlock + 1;
        endPage = startPage + perBlock - 1;
        // 마지막블럭은 끝페이지가 총 페이지수와 같아야함
        if (endPage > totalPage)
            endPage = totalPage;

        // 각페이지의 시작번호오 끝번호를 구한다
        // perPage가 5일경우
        // 예: 1페이지: 시작번호:1 끝번호:5
        // 예: 3페이지: 시작번호:1 끝번호:15
        startNum = (currentPage - 1) * perPage + 1;
        endNum = startNum + perPage - 1;

        // 마지막 페이지의 글번호 체크
        if (endNum > totalCount)
            endNum = totalCount;

        // 각페이지마다 출력할 시작번호
        // 총페이지가 30일겨우 1페이지는 30,2페이지는 25...
        no = totalCount - (currentPage - 1) * perPage;

        // 리스트 가죠오기
        List<BoardDto> list = dao.getList(startNum, endNum);

        // 페이징에 필요한 변수들 request로 저장....

        model.addObject("list", list);
        model.addObject("currentPage", currentPage);
        model.addObject("startPage", startPage);
        model.addObject("endPage", endPage);
        model.addObject("no", no);
        model.addObject("totalPage", totalPage);
        model.addObject("totalCount", totalCount);

        model.setViewName("/board/boardList");
        return model;
    }

    // 글쓰기 누르면 폼 보이게
    @GetMapping("/board/writeform")
    public String form() {
        return "/board/boardForm";
    }

    // 폼에 글입력후 저장되도록
    @PostMapping("/board/write")
    public String readData(@ModelAttribute BoardDto dto) {
        dao.insertBoard(dto);
        return "redirect:list";
    }

    // 제목누르면 content보기로
    @GetMapping("/board/content")
    public ModelAndView content(@RequestParam int num, @RequestParam int pageNum) {
        ModelAndView model = new ModelAndView();
        // 조회 1증가
        dao.updateReadcount(num);
        // 데이터 가져오기
        BoardDto dto = dao.getData(num);
        // 모델에 저장
        model.addObject("dto", dto);
        model.addObject("pageNum", pageNum);
        model.setViewName("/board/content");

        return model;
    }

    // content에서 삭제버튼 누르면 삭제되면서 바로 list로
    @GetMapping("/board/delete")
    public String delete(@RequestParam int num, @RequestParam String pageNum) {
        dao.boardDelete(num);

        return "redirect:list?pageNum=" + pageNum;
    }

    // content에서 수정버튼 누르면 수정폼이 나옴
    @GetMapping("/board/updateform")
    public ModelAndView updateform(@RequestParam int num, @RequestParam int pageNum) {
        ModelAndView model = new ModelAndView();
        BoardDto dto = dao.getData(num);
        model.addObject("pageNum", pageNum);
        model.addObject("dto", dto);
        model.setViewName("/board/updateForm");
        return model;

    }

    //수정폼에서 수정후 수정하기 누르면 수정하면서 list
    @PostMapping("/board/update")
    public String update(@ModelAttribute BoardDto dto, @RequestParam String pageNum) {
        dao.boardUpdate(dto);
        return "redirect:list?pageNum=" + pageNum;
    }

}

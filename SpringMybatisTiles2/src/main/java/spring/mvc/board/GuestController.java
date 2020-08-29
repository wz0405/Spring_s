package spring.mvc.board;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import guest.data.GuestDaoInter;
import guest.data.GuestDto;
import guest.data.SpringFileWriter;

@Controller
public class GuestController {

    @Autowired
    GuestDaoInter dao;

    @PostMapping("/guest/write")
    public String read(@ModelAttribute GuestDto dto, HttpServletRequest request) {

        // 일단 파일명이 어떻게 넘어오는지 확인
        for (MultipartFile f : dto.getUpfile()) {
            System.out.println("파일명: " + f.getOriginalFilename());
        }

        // 이미지 업로드 경로
        String path = request.getSession().getServletContext().getRealPath("/save");
        System.out.println(path);

        // path경로에 이미지저장
        SpringFileWriter filewriter = new SpringFileWriter();
        String imagename = "";

        for (MultipartFile f : dto.getUpfile()) {
            // 빈문자열이 아닐때만 저장
            if (f.getOriginalFilename().length() > 0) {
                imagename += f.getOriginalFilename() + ",";
                filewriter.writeFile(f, path, f.getOriginalFilename());
            }
        }

        if (imagename.length() == 0) // 이미지3개중 하나도 선택안했을대
        {
            imagename = "noimage";
        } else {
            // 마지막 컴마 제거
            imagename = imagename.substring(0, imagename.length() - 1);
        }

        // dto에 이미지 이름을 저장
        dto.setImagename(imagename);
        // db에 저장
        dao.insertGuest(dto);

        return "redirect:list";
    }

    // 메뉴를 눌렀을때 리스트로 이동
    @GetMapping("/guest/list")
    /*
     * public String list() { return "/guest/guestList"; //타일즈 주소 }
     */
    public ModelAndView list(@RequestParam(value = "pageNum", defaultValue = "1") int currentPage) {
        ModelAndView model = new ModelAndView();
        int totalCount;
        totalCount = dao.getTotalCount(); // 총데이타 갯수

        // 페이징처리에 필요한 변수
        int totalPage; // 총 페이지수
        int startNum; // 각페이지의 시작번호
        int endNum; // 각페이지의 끝번호
        int startPage; // 블럭의 시작페이지
        int endPage; // 블럭의 끝페이지
        int no; // 출력할 시작번호
        int perPage = 3; // 한페이지당 보여질 글의 갯수
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
        List<GuestDto> list = dao.getList(startNum, endNum);

        // 페이징에 필요한 변수들 request로 저장....
        model.addObject("list", list);
        model.addObject("currentPage", currentPage);
        model.addObject("startPage", startPage);
        model.addObject("endPage", endPage);
        model.addObject("no", no);
        model.addObject("totalPage", totalPage);
        model.addObject("totalCount", totalCount);

        model.setViewName("/guest/guestList");

        return model;
    }

    // 버튼을 누르면 폼으로 이동
    @GetMapping("/guest/form")
    public String form() {
        return "/guest/guestForm";
    }

    @GetMapping("/guest/delete")
    public String delete(@RequestParam int num, @RequestParam String pageNum, HttpServletRequest request) {
        // 이미지업로드 경로
        String path = request.getSession().getServletContext().getRealPath("/WEB-INF/save");
        System.out.println(path);

        // db에서 삭제하기 전에 이미지부터 지워야 한다
        String imagename = dao.getData(num).getImagename();
        if (!imagename.equals("noimage")) {
            // 이미지가 여러개일경우,로 분리
            String[] myimg = imagename.split(",");

            for (String s : myimg) {
                // 파일객체로 생성
                File f = new File(path + "//" + s);
                // 존재한다면 삭제
                if (f.exists())
                    f.delete();
            }
        }

        // 삭제
        dao.deleteGuest(num);

        return "redirect:list?pageNum=" + pageNum;
    }

}

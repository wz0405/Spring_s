package spring.mvc.upload;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class UploadController {
	@Autowired
	UploadDaoInter dao;
	@GetMapping("/list") //시작 페이지..인덱스 설정을 하지않으면 루트
	public ModelAndView list() {
		ModelAndView model = new ModelAndView();
		int totalcount = dao.getTotalCount();
		List<UploadDto>list=dao.getAllDatas();
		model.addObject("list", list);
		model.addObject("totalcount", totalcount);
		model.setViewName("upload/uploadList");
		return model;
	}
	//글쓰기 누르면 폼이 보이게 
	@GetMapping("/form")
	public String form() {
		return "upload/uploadForm";
	}
	//내용을 입력 후 db저장 버튼을 눌렀을때...파일입출력
	@PostMapping("/write")
	public String write(@ModelAttribute UploadDto dto,HttpServletRequest request) {
		
		//photo: 멀티파트: 콘솔에 찍히게
		System.out.println("이미지명: "+dto.getPhoto().getOriginalFilename());
		//톰캣서버의 경로를 구해야 프로젝트 경로를 구할 수 있다.
		//web-inf/save경로
		String path=request.getSession().getServletContext().getRealPath("/WEB-INF/save/");
		
		System.out.println(path);
		//이미지를 path에 저장
		FileOutputStream fos=null;
		try {
			fos=new FileOutputStream(path+"//"+dto.getPhoto().getOriginalFilename());
			byte []uploadData = dto.getPhoto().getBytes();
			fos.write(uploadData);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				fos.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}//dto가 다 들어옴 이미지 이름은 안들어옴
		//이미지 이름을 dto에 저장
		//db에 저장해야 나중에 가져옴
		dto.setPhotoname(dto.getPhoto().getOriginalFilename());
		//insert
		dao.insertUpload(dto);
		return "redirect:list"; //리스트 컨트롤러로 이동
	}
	
}

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UploadController {

	@Autowired
	UploadDaoInter dao;
	
	@RequestMapping({"/", "/list"})

	//시작페이지..인덱스 따로설정안하면 무조건/루트
	public ModelAndView list()
	{
		ModelAndView model=new ModelAndView();
		int totalcount=dao.getTotalCount();
		List<UploadDto>list=dao.getAllDatas();
		model.addObject("list",list );
		model.addObject("totalcount", totalcount);
		model.setViewName("upload/uploadList");
		return model;
	}
	
	//글쓰기누르면 폼이보이게
	@GetMapping("/form")
	public String form()
	{
		return "upload/uploadForm";
	}
	
	//내용을 입력후 db저장버튼 눌렀을때....파일입출력
	@PostMapping("/write")
	public String write(@ModelAttribute UploadDto dto,
			HttpServletRequest request)
	{
		//photo: 멀티파트:콘솔에 찍히게
		System.out.println("이미지명: "+dto.getPhoto().getOriginalFilename());
		//톰캣서버의 경로를 구해야 프로젝트 경로를 구할수있다
		//web-inf/save경로
		String path=request.getSession().getServletContext().getRealPath("/WEB-INF/save/");
		
		System.out.println("path="+path);
		
		//이미지를 path에저장
		FileOutputStream fos=null;
		
		try {
			fos=new FileOutputStream(path+"//"+dto.getPhoto().getOriginalFilename());
			
			byte []uploadData =dto.getPhoto().getBytes();
			fos.write(uploadData);
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				fos.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}//dto다 들어오는데 이미지 이름 안들어옴
		//이미지 이름을 dto에 저장
		//db에 저장해야 나중에 가져옴
		dto.setPhotoname(dto.getPhoto().getOriginalFilename());
		
		//insert
		dao.insertUpload(dto);
		return "redirect:list";  //list컨트롤러
	}
	
	
}


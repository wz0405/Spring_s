package spring.day0626.ex1;

import java.util.Map;

import org.springframework.jmx.export.annotation.ManagedAttribute;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FormDataController {
    @GetMapping("myform") // 매핑주소는 index에서 링크하므로 일치해야 한다.
    public String form1() {
        return "form1";
    }

    @GetMapping("/read1") // spring 5버젼부터 가능
    // @RequestMapping("/read1") //생략하면 get매핑
    // get방식 폼 전송
    public ModelAndView read1(@RequestParam("name") String name, @RequestParam int age,
                              @RequestParam(value = "msg", defaultValue = "Happy") String msg) {
        ModelAndView model = new ModelAndView();
        model.addObject("name", name);
        model.addObject("age", age);
        model.addObject("msg", msg);
        //포워드
        model.setViewName("process1");
        return model;
    }

    @PostMapping("/read2")
    public ModelAndView read2(@ModelAttribute TestDTO dto) {
        ModelAndView model = new ModelAndView();
        //dto로 request
        model.addObject("dto", dto);


        //포워드
        model.setViewName("process2");
        return model;

    }

    @PostMapping("/read3")
    public ModelAndView read3(@RequestParam Map<String, String> map) {
        ModelAndView model = new ModelAndView();
        String sang = map.get("sang");
        String price = map.get("price");
        String data = sang + "의 가격은" + price + "입니다";
        model.addObject("data", data);
        model.setViewName("process3");
        return model;
    }

    //생략하면 get mapping ,여러개의 매핑주소를 주고자 할 떄
    @RequestMapping({"/apple", "/kiwi", "/orange"})
    public String process() {
        return "process4"; //포워드할 jsp이름
    }
}

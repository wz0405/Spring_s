package spring.day0625.anno2;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("tc")
public class TireController {
	//@Autowired 캐나다와 한국이 켭침
	@Resource(name ="canadaTire")
	Tire tire;
	public void process() {
		String s=tire.getTire();
		System.out.println(s);
		
	}
	
}

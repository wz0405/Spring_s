package spring.day0625.anno2;

import org.springframework.stereotype.Component;

@Component
public class CanadaTire implements Tire {

	@Override
	public String getTire() {
		// TODO Auto-generated method stub
		return "캐나다타이어";
	}

}

package spring.day0625.ex1;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class HelloMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		System.out.println("자바 방식의 생성 및 출력 주소비교");
		Hello hello1 = new Hello();
		Hello hello2 = new Hello();
		System.out.println(hello1.getMessage());
		// 자바에서는 new로 생성할떄마다 새로운 영역에 생성된다.
		System.out.println(hello1 == hello2); // 레퍼런스 주소 비교

		// 스프링방식
		System.out.println("스프링방식의 생성 및 출력 주소비교");
		// 설정한 xml가져오기
		// 어플리케이션 실행시만 필요
		// 웹으로 실행시 web.xml에 설정이 되어있다.
		ApplicationContext app1 = new ClassPathXmlApplicationContext("appContext.xml");
		// 리소스엔 이름만 적어도 된다.
		
		//Hello 객체 생성
		//반환타입이 object타입이므로 형변환
		Hello h1=(Hello)app1.getBean("hello"); //방법1
		System.out.println(h1.getMessage());
		
		Hello h2=app1.getBean("hello", Hello.class);
		System.out.println(h2.getMessage());
		System.out.println(h1==h2);
		//기본적으로 스프링은 싱글톤
	}

}

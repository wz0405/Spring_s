package spring.day0625.anno2;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TireMain {

    public static void main(String[] args) {
        // TODO Auto-generated method stub
        ApplicationContext app = new ClassPathXmlApplicationContext("mysqldb/annoContext.xml");
        //getBean의 네임은 생략하면 클래스명으로 가져오고 아니면 명확한 이름으로 가져온다.
        //생략할 시엔 tireCController
        TireController tire = (TireController) app.getBean("tc");
        tire.process();
    }

}

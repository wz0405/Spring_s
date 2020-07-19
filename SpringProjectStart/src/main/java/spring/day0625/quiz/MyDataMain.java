package spring.day0625.quiz;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


public class MyDataMain {

    public static void main(String[] args) {
        // TODO Auto-generated method stub
        ApplicationContext app2 = new ClassPathXmlApplicationContext("spring/test2/appQuiz.xml");

        MyData my = app2.getBean("info1", MyData.class);
        my.writeData();
        MyData my2 = app2.getBean("score1", MyData.class);
        my2.writeData1();
    }

}

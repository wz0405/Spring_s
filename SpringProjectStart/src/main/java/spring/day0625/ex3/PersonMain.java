package spring.day0625.ex3;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class PersonMain {

    public static void main(String[] args) {
        // TODO Auto-generated method stub
        ApplicationContext app3 = new ClassPathXmlApplicationContext("appContext3.xml");

        Person pp = app3.getBean("per2", Person.class);
        pp.writeData();

        Person pp3 = (Person) app3.getBean("per");
        pp3.writeData();
    }

}

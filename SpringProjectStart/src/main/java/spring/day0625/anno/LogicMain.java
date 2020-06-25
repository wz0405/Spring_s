package spring.day0625.anno;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class LogicMain {
public static void main(String[] args) {
	ApplicationContext app1= new ClassPathXmlApplicationContext("mysqldb/annoContext.xml");
			
	LogicController logic1=(LogicController)app1.getBean("logic");
	logic1.insert("Happy");
	logic1.delete("2");
}
}

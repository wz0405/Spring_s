package spring.day0625.ex4;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class MysqlMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ApplicationContext app = new ClassPathXmlApplicationContext("mysqldb/mysqlContext.xml");
		Mysql my = (Mysql)app.getBean("db");
		System.out.println(my);
		
	}
	
}

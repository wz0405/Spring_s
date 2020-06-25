package spring.day0625.ex3;

public class Person {
	 //클래스를 가져와 멤버로
	PersonData data;
	public Person(PersonData data) {
		super();
		this.data=data;
	}
	public void writeData() {
		System.out.println(data.getSawonname());
		System.out.println(data.getPay());
		System.out.println(data.getIpsaday());
		
	}
}

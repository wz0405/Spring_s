package spring.day0625.quiz;

public class MyData {

    //Score, info 클래스를 멤버변수로 선언
    //스코어 인포를 각각 주입받는 생성자 만들기
    //출력 메서드 만들기 이름은 writeData
    //이름 자바 스프링 제이에스피 나이 
    Info in;
    Score sc;

    public MyData(Info in) {
        super();
        this.in = in;
        // TODO Auto-generated constructor stub
    }

    public MyData(Score sc) {
        super();
        this.sc = sc;
    }

    public void writeData() {
        System.out.println("이름: " + in.getName());
        System.out.println("나이: " + in.getAge());

    }

    public void writeData1() {
        System.out.println("자바성적: " + sc.getJava());
        System.out.println("jsp성적: " + sc.getJsp());
        System.out.println("spring성적: " + sc.getSpirng());
    }

}

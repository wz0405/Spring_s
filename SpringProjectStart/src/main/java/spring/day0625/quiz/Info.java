package spring.day0625.quiz;

public class Info {
    //멤버변수를 이룸, 나이
    public String name;
    public int age;

    public Info(String name, int age) {
        this.name = name;
        this.age = age;
        // TODO Auto-generated constructor stub
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }
}

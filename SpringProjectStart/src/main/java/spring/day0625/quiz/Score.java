package spring.day0625.quiz;

public class Score {
    //멤버변수3개를 만든다.
    public int java;
    public int jsp;
    public int spirng;

    public Score() {
        // TODO Auto-generated constructor stub
    }

    public Score(int java, int jsp, int spring) {
        this.java = java;
        this.jsp = jsp;
        this.spirng = spring;
    }

    public int getJava() {
        return java;
    }

    public void setJava(int java) {
        this.java = java;
    }

    public int getJsp() {
        return jsp;
    }

    public void setJsp(int jsp) {
        this.jsp = jsp;
    }

    public int getSpirng() {
        return spirng;
    }

    public void setSpirng(int spirng) {
        this.spirng = spirng;
    }
}

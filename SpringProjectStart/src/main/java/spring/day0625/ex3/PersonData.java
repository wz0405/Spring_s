package spring.day0625.ex3;

public class PersonData {
    private String sawonname;
    private int pay;
    private String ipsaday;

    //사원명은 생성자로 주입

    //페이와 입사데이는 세터로 주입
    public PersonData() {
        // TODO Auto-generated constructor stub
    }

    public PersonData(String sname) {
        sawonname = sname;
        // TODO Auto-generated constructor stub
    }

    public String getSawonname() {
        return sawonname;
    }

    public void setSawonname(String sawonname) {
        this.sawonname = sawonname;
    }

    public int getPay() {
        return pay;
    }

    public void setPay(int pay) {
        this.pay = pay;
    }

    public String getIpsaday() {
        return ipsaday;
    }

    public void setIpsaday(String ipsaday) {
        this.ipsaday = ipsaday;
    }


}

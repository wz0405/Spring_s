package spring.day0625.anno;

import org.springframework.stereotype.Component;

@Component
public class MyDao implements DaoInter {

    @Override
    public void insertData(String str) {
        System.out.println("str 데이타 db에 추가 성공");

    }

    @Override
    public void deleteData(String num) {
        // TODO Auto-generated method stub
        System.out.println("str 데이타 db에 삭제 성공");
    }

}

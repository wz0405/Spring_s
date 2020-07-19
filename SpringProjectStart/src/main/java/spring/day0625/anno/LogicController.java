package spring.day0625.anno;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("logic")
public class LogicController {
    //@Autowired //자동주입
    @Resource(name = "myDao")
    MyDao dao;
    DaoInter daointer;

    public LogicController(MyDao dao) {
        // TODO Auto-generated constructor stub
        this.dao = dao;
    }

    public void insert(String str) {
        dao.insertData(str);

    }

    public void delete(String num) {
        dao.deleteData(num);

    }
}

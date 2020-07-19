package member.data;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao extends SqlSessionDaoSupport implements MemberDaoInter {

    @Override
    public List<MemberDto> getAllDatas() {
        // TODO Auto-generated method stub
        return getSqlSession().selectList("selectAllDataOfMember");
    }

    @Override
    public void insertMember(MemberDto dto) {
        // TODO Auto-generated method stub
        getSqlSession().insert("insertOfMember", dto);
    }

    @Override
    public MemberDto getData(String num) {
        // TODO Auto-generated method stub
        return getSqlSession().selectOne("selectOneOfMember", num);
    }

    @Override
    public void updateMember(MemberDto dto) {
        // TODO Auto-generated method stub
        getSqlSession().update("updateOfMember", dto);
    }

    @Override
    public void deleteMember(MemberDto dto) {
        // TODO Auto-generated method stub
        getSqlSession().update("deleteOfMember", dto);
    }

    @Override
    public boolean isLogin(String id, String pass) {
        // TODO Auto-generated method stub
        HashMap<String, String> map = new HashMap<String, String>(); //해쉬 맵 사용
        map.put("id", id);
        map.put("pass", pass);
        int n = getSqlSession().selectOne("loginSuccess", map);
        return n == 1 ? true : false; //3항연산자, 일치하는 아이디가 있으면 true 없으면 false
    }

    @Override
    public String getName(String id) {
        // TODO Auto-generated method stub
        String name = getSqlSession().selectOne("nameByMember", id);

        return name;
    }

}

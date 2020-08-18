package board.data;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDao extends SqlSessionDaoSupport implements BoardDaoInter {

    @Override
    public int getTotalCount() {
        // TODO Auto-generated method stub
        return getSqlSession().selectOne("selectCountOfBoard");
    }

}

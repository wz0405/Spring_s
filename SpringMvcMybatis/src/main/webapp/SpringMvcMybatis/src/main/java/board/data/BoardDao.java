package board.data;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDao extends SqlSessionDaoSupport implements BoardDaoInter {

    @Override
    public int getTotalCount() {
        // TODO Auto-generated method stub
        return getSqlSession().selectOne("selectCountOfBoard");
    }

    @Override
    public void insertBoard(BoardDto dto) {
        // dao���� dto�� �ѱ�°�
        getSqlSession().insert("insertOfBoard", dto);
    }

    @Override
    public List<BoardDto> getAllDatas() {
        // TODO Auto-generated method stub
        return getSqlSession().selectList("selectAllOfBoard");
    }

}

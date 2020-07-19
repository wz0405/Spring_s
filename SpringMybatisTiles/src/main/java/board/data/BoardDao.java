package board.data;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDao extends SqlSessionDaoSupport implements BoardDaoInter {

    @Override
    public int getTotalCount() {
        // TODO Auto-generated method stub
        int n = getSqlSession().selectOne("TotalCountOfBoard");
        return n;
    }

    @Override
    public void insertBoard(BoardDto dto) {
        getSqlSession().insert("InsertOfBoard", dto);

    }

    @Override
    public List<BoardDto> getList(int start, int end) {
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("start", start);
        map.put("end", end);
        return getSqlSession().selectList("selectPagingofBoard", map);

    }

    @Override
    public void updateReadcount(int num) {
        getSqlSession().update("boardUpdateReadcount", num);

    }

    @Override
    public BoardDto getData(int num) {
        // TODO Auto-generated method stub
        return getSqlSession().selectOne("SelectOneOfBoard", num);
    }

    @Override
    public void boardDelete(int num) {
        // TODO Auto-generated method stub
        getSqlSession().delete("deleteOfBoard", num);
    }

    @Override
    public void boardUpdate(BoardDto dto) {
        getSqlSession().update("updateOfBoard", dto);

    }


}

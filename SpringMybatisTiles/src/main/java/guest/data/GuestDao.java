package guest.data;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

@Repository
public class GuestDao extends SqlSessionDaoSupport implements GuestDaoInter{

	@Override
	public void insertGuest(GuestDto dto) {
		getSqlSession().insert("insertOfGuest", dto);
		
	}
	@Override
	public List<GuestDto> getList(int start, int end) {

		Map<String, Integer>map=new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		return getSqlSession().selectList("selectPagingofGuest", map);
	}

	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("guestTotalCount");
	}
	@Override
	public void deleteGuest(int num) {
		getSqlSession().delete("deleteOfGuest", num);
		
	}

	@Override
	public GuestDto getData(int num) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("guestSelectOneByNum", num);
	}



}

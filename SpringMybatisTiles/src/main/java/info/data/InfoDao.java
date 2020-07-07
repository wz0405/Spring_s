package info.data;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;
@Repository
public class InfoDao extends SqlSessionDaoSupport implements InfoDaoInter {

	@Override
	public List<InfoDto> getAllDatas() {
		// TODO Auto-generated method stub
		return getSqlSession().selectList("selectAllDatasOfInfo");
	}

	@Override
	public void insertInfo(InfoDto dto) {
		// TODO Auto-generated method stub
		getSqlSession().insert("insertOfInfo", dto);
	}

}

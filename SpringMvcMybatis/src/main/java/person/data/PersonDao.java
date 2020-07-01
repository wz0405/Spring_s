package person.data;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;  //crud객체를 가지고 있음 
import org.springframework.stereotype.Repository;

@Repository
public class PersonDao extends SqlSessionDaoSupport implements PersonDaoInter{

	@Override
	public List<PersonDto> getAllDatas() {
		// TODO Auto-generated method stub
		return getSqlSession().selectList("selectAllOfPerson");
	}

	@Override
	public void insertPerson(PersonDto dto) {
		// TODO Auto-generated method stub
		getSqlSession().insert("insertOfPerson", dto);
	}

	@Override
	public PersonDto getData(String num) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("selectOneOfPerson", num);
	}

	@Override
	public void updatePerson(PersonDto dto) {
		// TODO Auto-generated method stub
		getSqlSession().update("updateOfPerson", dto);
	}

	@Override
	public void deletePerson(PersonDto dto) {
		// TODO Auto-generated method stub
		getSqlSession().delete("deleteOfPerson", dto);
	}

}

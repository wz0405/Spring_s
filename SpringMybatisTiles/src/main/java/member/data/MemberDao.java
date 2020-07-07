package member.data;

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
		getSqlSession().insert("insertOfMember",dto);
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

}

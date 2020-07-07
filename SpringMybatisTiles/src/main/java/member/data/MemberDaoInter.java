package member.data;

import java.util.List;


public interface MemberDaoInter {
	public List<MemberDto> getAllDatas();
	public void insertMember(MemberDto dto);
	public MemberDto getData(String num);
	public void updateMember(MemberDto dto);
	public void deleteMember(MemberDto dto);
	
	//아이디 비번 체크
	public boolean isLogin(String id,String pass);
	//네임얻기 
	public String getName(String id);
}

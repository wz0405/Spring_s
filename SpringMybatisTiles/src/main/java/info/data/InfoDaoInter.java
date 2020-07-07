package info.data;

import java.util.List;



public interface InfoDaoInter {
	public List<InfoDto> getAllDatas();
	public void insertInfo(InfoDto dto);
}

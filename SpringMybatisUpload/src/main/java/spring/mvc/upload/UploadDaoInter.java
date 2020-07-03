package spring.mvc.upload;

import java.util.List;

public interface UploadDaoInter {
	public int getTotalCount();
	public List<UploadDto> getAllDatas();
	public void insertUpload(UploadDto dto);
}

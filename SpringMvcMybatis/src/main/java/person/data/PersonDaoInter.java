package person.data;

import java.util.List;


public interface PersonDaoInter {
	public List<PersonDto> getAllDatas();
	public void insertPerson(PersonDto dto);
}

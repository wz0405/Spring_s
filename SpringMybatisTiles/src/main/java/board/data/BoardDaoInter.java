package board.data;

import java.util.List;

public interface BoardDaoInter {
	public int getTotalCount();
	public void insertBoard(BoardDto dto);
	public List<BoardDto> getList(int start,int end);
	public void updateReadcount(int num);
	public BoardDto getData(int num);
	public void boardDelete(int num);
	public void boardUpdate(BoardDto dto);


}

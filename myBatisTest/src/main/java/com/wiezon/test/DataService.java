package com.wiezon.test;


import java.util.List;

public interface DataService {
	List<Data> getDataInfo(String no, String date, String balsang, String balgu, String volt, String arm, String power,
			String energyGye, String energyNu);
}

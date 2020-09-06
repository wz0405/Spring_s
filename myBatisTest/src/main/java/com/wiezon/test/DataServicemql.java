package com.wiezon.test;


import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

@Service("dataServie")
@Repository
public class DataServicemql implements DataService {

	
	@Autowired 
	private DataMapper dataMapper;
	@Override
	public List<Data> getDataInfo(String no, String date, String balsang, String balgu, String volt, String arm,
			String power, String energyGye, String energyNu) {
	
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("no",no);
		map.put("date",date);
		map.put("balsang",balsang);
		map.put("balgu",balgu);
		map.put("volt",volt);
		map.put("arm",arm);
		map.put("power",power);
		map.put("energyGye",energyGye);
		map.put("energyNu",energyNu);
		
		
		return dataMapper.getDataInfo(map);
	}

}

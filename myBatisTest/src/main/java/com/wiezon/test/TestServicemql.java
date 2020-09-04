package com.wiezon.test;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("testService")
@Repository
public class TestServicemql implements TestService {
	
	@Autowired
	private TestMapper testMapper;
	
	@Override
	public List<Test> getUserInfo(String id, String password) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id",id);
		map.put("password",password);
		
		return testMapper.getUserInfo(map);

		
	}


	
}

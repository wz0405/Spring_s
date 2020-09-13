package com.wiezon.test;


import java.util.HashMap;
import java.util.List;


public interface DataMapper {
	public List<Data> getDataInfo(HashMap<String, Object> map);
}

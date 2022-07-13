package com.peng.service.impl;


import com.peng.mapper.SearchMapper;
import com.peng.service.SearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("searchService")
public class SearchServiceImpl implements SearchService {

    @Autowired
    private SearchMapper searchMapper;

    public Object search(String name) {
        Object search =null;
        try{
            search =  searchMapper.search(name);
            return  search;
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }
}

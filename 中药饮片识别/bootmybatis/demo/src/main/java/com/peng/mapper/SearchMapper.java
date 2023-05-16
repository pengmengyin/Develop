package com.peng.mapper;


import com.peng.entity.Search;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface SearchMapper {
    Search search(@Param("searchName") String name);
}

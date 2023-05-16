package com.peng.mapper;


import com.peng.entity.Mistake;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface MyMapper {
    void updateDesc(@Param("desc") String  desc,@Param("userTel") Long tel);

    void updateGender(@Param("uid") Integer id,@Param("gender") Integer gender);

    void updatename(@Param("uid") Integer id,@Param("username") String name);

    void updateimg(@Param("uid") Integer id, @Param("img") String flag);

    List<Mistake>searchmis(@Param("id") Integer id);

    void remove(@Param("id") int id);

    void removeall(@Param("id") int id);
}

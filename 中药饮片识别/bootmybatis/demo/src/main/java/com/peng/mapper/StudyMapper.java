package com.peng.mapper;


import com.peng.entity.Photo;
import com.peng.entity.Stonename;
import com.peng.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface StudyMapper {
    Object searchphoto(@Param("uid") int id);

    Object searchname(@Param("uid") int id);

    List<Stonename> searchother(@Param("uid") int id);

    Integer searchscore(@Param("phone") Long tel);

    Void updatescore(@Param("phone") Long tel, @Param("score") Integer score);



    User searchid(@Param("phone") Long tel);

    void inserquestion(@Param("id") int id,@Param("name") String name,@Param("src") String src);

    Photo searchview(@Param("uid") int id);
}

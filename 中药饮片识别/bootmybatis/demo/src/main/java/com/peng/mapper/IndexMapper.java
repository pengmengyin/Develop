package com.peng.mapper;


import com.peng.entity.Stone;
import com.peng.entity.Views;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface IndexMapper {
    Object search(@Param("uid") String id);

    List<Stone> searchstone();

    List<Views> searchscene();

    Object searchlocal(@Param("uid") String id);
}

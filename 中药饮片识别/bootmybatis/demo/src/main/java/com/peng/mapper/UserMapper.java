package com.peng.mapper;
import com.peng.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Mapper
@Repository

public interface UserMapper {

        User findUserTel(@Param("userTel") Long tel);

        User findPwd(@Param("userTel") Long tel , @Param("userPwd") String pwd);

        User inserData(@Param("userTel") Long tel, @Param("userPwd")String pwd);

        void updataPwd(@Param("userTel") Long tel,@Param("userPwd") String pwd);
    }
package com.peng.service;


import com.peng.entity.RegisterStatus;
import com.peng.entity.User;

public interface UserService {

    User dotel(Long tel, String pwd);

    RegisterStatus insertuser(Long tel, String pwd);

    Boolean seletUserphone(Long phone);

    Boolean recoverypwd(Long tel, String pwd);
}

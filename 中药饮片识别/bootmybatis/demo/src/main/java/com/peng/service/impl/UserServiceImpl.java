package com.peng.service.impl;


import com.peng.entity.RegisterStatus;
import com.peng.entity.User;
import com.peng.mapper.UserMapper;
import com.peng.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    /**
     *登陆
     * @param tel
     * @param pwd
     * @return
     */
    @Override
    public User dotel(Long tel, String pwd) {
        User usertel=null;
        try {
             usertel = userMapper.findUserTel(tel);
            if (usertel.getTel()!=null){
                User userpwd = userMapper.findPwd(tel,pwd);
                if(userpwd.getTel()!=null){
                    //手机号密码都对
                    return userpwd;
                }else {
                    //密码不对
                    return null;
                }
            }else{
                //不存在
                return null;
            }
        }catch (Exception e){
            //e.printStackTrace();
            return null;
        }
    }

    /**
     * 注册
     * @param tel
     * @param pwd
     * @return
     */
    @Override
    public RegisterStatus insertuser(Long tel,String pwd) {
            RegisterStatus restatus = new RegisterStatus();
            User userTel =null;
        try{
            userTel = userMapper.findUserTel(tel);
            if(userTel.getTel()!=null){
                //不存在，新增用户
                restatus.setCode(500);
                restatus.setUser(userTel);
                return restatus;
            }
        } catch (Exception e){
//            e.printStackTrace();
            userMapper.inserData(tel,pwd);
            userTel = userMapper.findUserTel(tel);
            restatus.setCode(200);
            restatus.setUser(userTel);
            return  restatus;
        }
        return null;
    }

    /**
     * 查询电话
     * @param phone
     * @return
     */
    @Override
    public Boolean seletUserphone(Long phone) {
        try{
            Object userphone = userMapper.findUserTel(phone);
            if(userphone!=null)
            return true;
        }catch (Exception e){
            //e.printStackTrace();
        }
        return false;
    }

    /**
     * 修改密码
     * @param tel
     * @param pwd
     * @return
     */
    @Override
    public Boolean recoverypwd(Long tel, String pwd) {
        try {
            userMapper.updataPwd(tel,pwd);
            return true;
        }catch (Exception e){
            //e.printStackTrace();
        }
        return false;
    }


}

package com.peng.service.impl;


import com.peng.entity.Mistake;
import com.peng.mapper.MyMapper;
import com.peng.service.MyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("myService")

public class MyServiceImpl implements MyService {
    @Autowired
    private MyMapper myMapper;

    /**
     * 个签
     * @param desc
     * @param tel
     * @return
     */
    @Override
    public Boolean updatedesc(String desc,Long tel) {
        try {
            myMapper.updateDesc(desc,tel);
            return true;
        }catch (Exception e){
            //e.printStackTrace();
        }
        return false;
    }

    /**
     * 性别
     * @param id
     * @param gender
     * @return
     */
    @Override
    public Boolean updategender(Integer id, Integer gender) {
        try {
            myMapper.updateGender(id,gender);
            return true;
        }catch (Exception e){
            //e.printStackTrace();
        }
        return null;
    }

    @Override
    public Boolean updatename(Integer id, String name) {
        try {
            myMapper.updatename(id,name);
            return true;
        }catch (Exception e){
            //e.printStackTrace();
        }
        return null;
    }

    @Override
    public Boolean updateimg(Integer id, String flag) {
        try {
            myMapper.updateimg(id,flag);
            return true;
        }catch (Exception e){
            //e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Mistake> searchmistake(Integer id) {
        try {
            List<Mistake> misList = myMapper.searchmis(id);
            return misList;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public void remove(int id) {
        try {
            myMapper.remove(id);
            return ;
        } catch (Exception e) {
            e.printStackTrace();
            return ;
        }
    }

    @Override
    public void removeall(int id) {
        try {
            myMapper.removeall(id);
            return ;
        } catch (Exception e) {
            e.printStackTrace();
            return ;
        }
    }
}

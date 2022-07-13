package com.peng.service;


import com.peng.entity.Mistake;

import java.util.List;

public interface MyService {
    Boolean updatedesc(String desc,Long tel);

    Boolean updategender(Integer id, Integer gender);

    Boolean updatename(Integer id, String name);

    Boolean updateimg(Integer id, String flag);

    List<Mistake> searchmistake(Integer id);

    void remove(int id);

    void removeall(int id);
}

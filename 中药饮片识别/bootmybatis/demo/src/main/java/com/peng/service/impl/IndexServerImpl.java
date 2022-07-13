package com.peng.service.impl;


import com.peng.entity.Stone;
import com.peng.entity.Views;
import com.peng.mapper.IndexMapper;
import com.peng.service.IndexServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("indexService")
public class IndexServerImpl implements IndexServer {

    @Autowired
    private IndexMapper indexMapper;

    public Object search(String id) {
        Object news = null;
        try {
            news = indexMapper.search(id);
            return news;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public List<Stone> searchstone() {

        try {
           List<Stone> stoneList = indexMapper.searchstone();
            return stoneList;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

    @Override
    public List<Views> searchscene() {

        try {
            List<Views> sceneList = indexMapper.searchscene();
            return sceneList;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public Object searchlocal(String id) {
        Object local = null;
        try {
            local = indexMapper.searchlocal(id);
            return local;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }


}

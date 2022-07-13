package com.peng.controller;


import com.peng.entity.SearchCode;
import com.peng.entity.Stone;
import com.peng.entity.Views;
import com.peng.service.IndexServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController("IndexController")
@RequestMapping("/index")
@CrossOrigin
public class IndexController {
    @Autowired
    private SearchCode searchCode;




    @Autowired
    private IndexServer indexServer;

    @GetMapping("news")
    public Object search(@RequestParam("id")String id){
        Object news = indexServer.search(id);

        if (news!=null){
            searchCode.setCode(200);
            searchCode.setSearch(news);
            return searchCode;
        }
        return null;
    }

    /**
     * 查询石头
     * @return
     */
    @GetMapping("stone")
    public List<Object> search_stone(){
        List<Stone> stoneList = indexServer.searchstone();
        List<Object> searchStoneList= new ArrayList<>();
        for (Stone stone:stoneList)
        {
            if (stone!=null){
                SearchCode searchCode=new SearchCode();
                searchCode.setCode(200);
                searchCode.setSearch(stone);
                searchStoneList.add(searchCode);
            }
        }
        return searchStoneList;
    }

    @GetMapping("scene")
    public List<Object> search_scene(){
        List<Views> sceneList = indexServer.searchscene();
        List<Object> searchSceneList= new ArrayList<>();
        for (Views scene:sceneList)
        {
            if (scene!=null){
                SearchCode searchCode=new SearchCode();
                searchCode.setCode(200);
                searchCode.setSearch(scene);
                searchSceneList.add(searchCode);
            }
        }
        return searchSceneList;
    }

    @GetMapping("local")
    public Object searchlocal(@RequestParam("id")String id){
        Object local = indexServer.searchlocal(id);

        if (local!=null){
            searchCode.setCode(200);
            searchCode.setSearch(local);
            return searchCode;
        }
        return null;
    }
}

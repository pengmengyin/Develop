package com.peng.controller;


import com.peng.entity.SearchCode;
import com.peng.service.StudyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Set;

@RestController("StudyController")
@RequestMapping("/study")
@CrossOrigin
public class StudyController {
    @Autowired
    private SearchCode searchCode;

    @Autowired
    private StudyService studyService;

    @GetMapping("getphoto")
    public Object searchPhone(@RequestParam("ID") int id){
        Object photo = studyService.searchphoto(id);

        if (photo!=null){
            searchCode.setCode(200);
            searchCode.setSearch(photo);
            return searchCode;
        }
        return null;

    }

    @GetMapping("getname")
    public Set<Object> searName(@RequestParam("ID") int id){
       Set<Object> stonename= studyService.searchname(id);

       return stonename;
    }

    @GetMapping("updatescore")
    public Void updatascore (@RequestParam("phone") Long tel,
                                   @RequestParam("score")Integer score){
         return studyService.updatescore(tel,score);
    }

    @GetMapping("mistakequestion")
    public Void insertquestion(@RequestParam("phone")Long tel,
                               @RequestParam("ID")int id){
       return studyService.inserquestion(tel,id);
    }
}

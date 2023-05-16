package com.peng.controller;


import com.peng.entity.SearchCode;
import com.peng.service.SearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController("SearchController")
@RequestMapping("/api")
@CrossOrigin
public class SearchController {
    @Autowired
    private SearchService searchService;

    @Autowired
    private SearchCode searchCode;

    @GetMapping("search")
    public SearchCode search(@RequestParam("searchName")String name){
        SearchCode searchCode=new SearchCode();
        Object search = searchService.search(name);

       if (search!=null){
           searchCode.setCode(200);
           searchCode.setSearch(search);
           return searchCode;
       }
      return null;
    }
}

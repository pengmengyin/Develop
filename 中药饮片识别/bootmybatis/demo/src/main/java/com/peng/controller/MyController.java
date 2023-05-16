package com.peng.controller;


import cn.hutool.core.io.FileUtil;
import cn.hutool.core.util.IdUtil;

import com.peng.entity.Mistake;
import com.peng.entity.SearchCode;
import com.peng.entity.StatusCode;
import com.peng.service.MyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


@RestController("MyController")
@RequestMapping("/update")
@CrossOrigin
public class MyController {
    @Autowired
    private MyService myService;


    @Autowired
    private StatusCode statusCode;

    /**
     * 更新个签
     * @param desc
     * @param tel
     * @return
     */
    @GetMapping("user_desc")
    public StatusCode updatadesc(@RequestParam("userdesc") String desc,
                                 @RequestParam("Phone")Long tel){
        Boolean updesc = myService.updatedesc(desc,tel);
        if(updesc){
            statusCode.setCode(200);
            statusCode.setSuccess("true");
            statusCode.setMsg("修改成功");
            return statusCode;
        }else{
            return statusCode;
        }
    }

    /**
     * 更新性别
     * @param id
     * @param gender
     * @return
     */
    @GetMapping("user_gender")
    public StatusCode updatagender(@RequestParam("id") Integer id,
                                   @RequestParam("usergender") Integer gender){
        Boolean upgender = myService.updategender(id,gender);
        if(upgender){
            statusCode.setCode(200);
            statusCode.setSuccess("true");
            statusCode.setMsg("修改成功");
            return statusCode;
        }else{
            return statusCode;
        }
    }

    /**
     * 更新名字
     * @param id
     * @param name
     * @return
     */
    @GetMapping("name")
    public StatusCode updatename(@RequestParam("id") Integer id,
                                 @RequestParam("name") String name){
        Boolean upname = myService.updatename(id,name);
        if(upname){
            statusCode.setCode(200);
            statusCode.setSuccess("true");
            statusCode.setMsg("修改成功");
            return statusCode;
        }else{
            return statusCode;
        }
    }

    /**
     * 上传图片
     * @param id
     * @param fileapi/login
     * @return
     * @throws IOException
     */
    @PostMapping("image")
    public StatusCode image(@RequestParam("id") Integer id, MultipartFile file) throws IOException {
        String originalFilename = file.getOriginalFilename();//获取源文件名称
        //定义文件唯一标识
        String flag = IdUtil.fastSimpleUUID();
        String rootFilepath  = System.getProperty("user.dir") +"/src/main/resources/static/images/headimg/" +flag+"_"+originalFilename;//获取上传路径
        System.out.println(rootFilepath);
        FileUtil.writeBytes(file.getBytes(),rootFilepath);//把文件写入上传路径
        String imgurl = "http://101.201.118.42:8080/images/headimg/"+flag+"_"+originalFilename;
        Boolean upimage = myService.updateimg(id,imgurl);
        if(upimage){
            statusCode.setMsg(imgurl);
            return statusCode;
        }else{
            return statusCode;
        }
    }

    /**
     * 查询错题
     * @param id
     * @return
     */
    @GetMapping("mistake")
    public List<Object> search_scene(@RequestParam("id")int id){
        List<Mistake> misList = myService.searchmistake(id);
        List<Object> searchMisList= new ArrayList<>();
        for (Mistake mis:misList)
        {
            if (mis!=null){
                SearchCode searchCode=new SearchCode();
                searchCode.setCode(200);
                searchCode.setSearch(mis);
                searchMisList.add(searchCode);
            }
        }
        return searchMisList;
    }

    @GetMapping("remove")
    public void remove(@RequestParam("id") int id){
        myService.remove(id);
        return;
    }

    @GetMapping("removeall")
    public void removeall(@RequestParam("id") int id){
        myService.removeall(id);
        return;
    }
}

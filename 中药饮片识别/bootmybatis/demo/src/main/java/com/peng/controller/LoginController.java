package com.peng.controller;

import com.peng.entity.RegisterStatus;
import com.peng.entity.StatusCode;
import com.peng.entity.User;
import com.peng.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


@RestController("LoginController")
@RequestMapping("/api")
@CrossOrigin
public class LoginController {

    @Autowired
    private UserService userService;

    @Autowired
    private StatusCode statusCode;
    /**
     * 登陆
     * @param tel
     * @param pwd
     * @return
     */
    @GetMapping ("/login")
    public StatusCode login(@RequestParam("userTel")Long tel,
                            @RequestParam("userPwd")String pwd){
        StatusCode  statusCode =new StatusCode();
        User user = userService.dotel(tel,pwd);
        if(user!=null){
            statusCode.setUser(user);
            statusCode.setCode(200);
            statusCode.setMsg("登陆成功");
            statusCode.setSuccess("true");
            return statusCode;
        }else {
            statusCode.setCode(500);
            statusCode.setMsg("请检查手机号与密码");
            statusCode.setSuccess("false");
            return statusCode;
        }
    }

    /**
     * 注册
     * @param tel
     * @param pwd
     * @return
     */
    @GetMapping  ("register")
    public StatusCode insertUser(@RequestParam("userTel")Long tel,
                                 @RequestParam("userPwd")String pwd){
        StatusCode statusCode =new StatusCode();
        RegisterStatus restatus = userService.insertuser(tel,pwd);
        if(restatus.getCode()==500){
            statusCode.setCode(500);
            statusCode.setUser(restatus.getUser());
            statusCode.setMsg("手机号已经被注册,请重新登录");
            statusCode.setSuccess("false");
            return statusCode;
        }
        else {
            statusCode.setCode(200);
            statusCode.setUser(restatus.getUser());
            statusCode.setMsg("注册成功");
            statusCode.setSuccess("true");
            return statusCode;
        }
    }

    /**
     * 查询电话
     * @param phone
     * @return
     */
    @GetMapping("selectUser")
    public StatusCode selectUser (@RequestParam("phone")Long phone){
        Boolean select = userService.seletUserphone(phone);
        if(select){
            statusCode.setSuccess("true");
            statusCode.setCode(200);
            return statusCode;
        }else {
            statusCode.setSuccess("false");
            statusCode.setCode(0);
            statusCode.setMsg("此用户不存在");
            return statusCode;
        }
    }

    /**
     * 修改密码
     * @param tel
     * @param pwd
     * @return
     */
    @GetMapping("recovery")
    public  StatusCode recovery(@RequestParam("userTel")Long tel,
                                @RequestParam("userPwd")String pwd){
        Boolean recovery = userService.recoverypwd(tel,pwd);
        if(recovery){
            statusCode.setCode(200);
            statusCode.setSuccess("true");
            statusCode.setMsg("修改成功");
            return statusCode;
        }else{
            return statusCode;
        }
    }
}

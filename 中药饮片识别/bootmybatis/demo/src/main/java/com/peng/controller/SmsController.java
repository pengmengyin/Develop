package com.peng.controller;
import com.github.qcloudsms.SmsSingleSender;
import com.github.qcloudsms.SmsSingleSenderResult;
import com.github.qcloudsms.httpclient.HTTPException;
import com.peng.entity.Sms;
import org.json.JSONException;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

/**
 * 短信验证
 */
@RestController
@RequestMapping("/sms")
@CrossOrigin
public class SmsController {
    @GetMapping("/sendcode")
    private Sms SMS(@RequestParam("Phone") Long phone)
    {
        Sms sms = new Sms();
        // 短信应用SDK AppID
        int appid = 1400657140; // 1400开头

        // 短信应用SDK AppKey
        String appkey = "58e8e0f60f23e43cc8e18da3ca56c4ef";

        // 需要发送短信的手机号码
        String[] phoneNumbers = {String.valueOf(phone)};

        // 短信模板ID，需要在短信应用中申请
        int templateId = 1378391; // NOTE: 这里的模板ID`7839`只是一个示例，真实的模板ID需要在短信控制台中申请

        // 签名
        String smsSign = "浅试项目"; // NOTE: 这里的签名"腾讯云"只是一个示例，真实的签名需要在短信控制台中申请，另外签名参数使用的是`签名内容`，而不是`签名ID`
        try{
            String verificationCode = String.valueOf((int)((Math.random()*9+1)*1000));
            String[] parms= {verificationCode};
            SmsSingleSender ssender = new SmsSingleSender(appid,appkey);
            SmsSingleSenderResult result = ssender.sendWithParam("86", phoneNumbers[0], templateId,parms,smsSign,"","");
            System.out.println(result);
            sms.setCode(Double.parseDouble(verificationCode));
            sms.setSuccess("true");
        }catch (HTTPException e){
            e.printStackTrace();
        }catch (JSONException e){
            e.printStackTrace();
        }catch (IOException e){
            e.printStackTrace();
        }
        return sms;
    }
}

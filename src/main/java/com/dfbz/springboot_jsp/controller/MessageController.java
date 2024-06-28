package com.dfbz.springboot_jsp.controller;

import com.dfbz.springboot_jsp.config.R;
import com.dfbz.springboot_jsp.mapper.MessageMapper;
import com.dfbz.springboot_jsp.pojo.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/message")
public class MessageController {

    @Autowired
    MessageMapper messageMapper;

    /*用户 发送 留言信息 给 后端*/

    @RequestMapping("/send")
    public R addMessage(Message message){
        int i = messageMapper.addMessage(message);
        if (i > 0){
            return new R(true);
        }else {
            return new R(false);
        }
    }

    /*管理员 查看 所有 留言信息*/

    @RequestMapping("/list")
    public R selectAll(){
        List<Message> list = messageMapper.list();
        if (list != null){
            return new R(true,list);
        }else {
            return new R(false);
        }
    }
}

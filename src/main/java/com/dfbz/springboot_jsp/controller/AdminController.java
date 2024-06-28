package com.dfbz.springboot_jsp.controller;

import com.dfbz.springboot_jsp.config.R;
import com.dfbz.springboot_jsp.mapper.AdminMapper;
import com.dfbz.springboot_jsp.pojo.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    AdminMapper adminMapper;

    /*admin注册*/

    @RequestMapping("/register")
    public R register(Admin admin){
        int i = adminMapper.insertAdmin(admin);
        if (i > 0){
            return new R(true);
        }else {
            return new R(false);
        }
    }

    /*admin登录*/

    @RequestMapping("/login")
    public R login(String aname, String apass){
        Admin admin = adminMapper.selectByNamePass(aname, apass);
        if (admin!=null){
            return new R(true,admin);
        }else {
            return new R(false);
        }
    }

    /*查看所有管理员 列表*/

    @RequestMapping("/list")
    public R selectAll(){
        List<Admin> list = adminMapper.list();
        if (list != null){
            return new R(true,list);
        }else {
            return new R(false);
        }
    }

    /* 逻辑 注销 admin 账户*/

    @RequestMapping("/deleted")
    public R deletedAdmin(String aname){
        System.out.println(aname);
        int i = adminMapper.deletedAdmin(0, aname);
        if (i > 0){
            return new R(true);
        }else {
            return new R(false);
        }
    }

    /*修改 管理员信息 */

    @RequestMapping("/update")
    public R updateAdmin(Admin admin){
        int i = 0;
        try {
            i = adminMapper.updateAdminInfo(admin);
        } catch (Exception e) {
            return new R(false);
        }
        if (i > 0){
            return new R(true);
        }else {
            return new R(false);
        }
    }

}

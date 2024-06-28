package com.dfbz.springboot_jsp.controller;

import com.dfbz.springboot_jsp.config.R;
import com.dfbz.springboot_jsp.mapper.UserMapper;
import com.dfbz.springboot_jsp.pojo.City;
import com.dfbz.springboot_jsp.pojo.Item;
import com.dfbz.springboot_jsp.pojo.Message;
import com.dfbz.springboot_jsp.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.jws.soap.SOAPBinding;
import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserMapper userMapper;

    /*user 注册*/

    @RequestMapping("/register")
    public R register(User user){
        int i = userMapper.insertUser(user);
        if (i > 0){
            return new R(true);
        }else {
            return new R(false);
        }
    }

    /*user 登录*/

    @RequestMapping("/login")
    public R login( String uname, String upass){
        User user = userMapper.selectByNamePass(uname, upass);
        System.out.println(user);
        if (user != null){
            return new R(true,user);
        }else {
            return new R(false);
        }
    }

    /*根据 用户 id 逻辑 删除 个人信息*/

    @RequestMapping("/deleted")
    public R deletedById(int uid){
        int i = userMapper.delectUserInfo(0, uid);
        if (i > 0){
            return new R(true);
        }else {
            return new R(false);
        }
    }

    /*向购物车中添加 city信息*/

    @RequestMapping("/add")
    public R addCityInfo(int uid,int cid){
        int i = 0;
        try {
            i = userMapper.addCityInfo(uid, cid);
        } catch (Exception e) {
            return new R(false);
        }
        if (i > 0){
            return new R(true);
        }else {
            return new R(false);
        }
    }

    /*查看 购物车 的 city 信息*/

    @RequestMapping("/show")
    public R selectByUid(int uid){
        List<City> cities = userMapper.selectByUid(uid);
        for (City city : cities) {
            int city_id = city.getCity_id();
            Item item = userMapper.selectNumber(uid,city_id);
            city.setItem(item);
        }
        if (!cities.isEmpty()){
            return new R(true,cities);
        }else {
            return new R(false);
        }
    }

    /*移除 购物车 中的 景点 信息*/

    @RequestMapping("delcity")
    public R delectCity(int uid,int cid){
        int i = userMapper.delCity(uid, cid);
        if (i > 0){
            return new R(true);
        }else {
            return new R(false);
        }
    }


    
    /*上传 用户 头像*/

    @RequestMapping("/image")
    public R updateImage(String uimage,int uid){
        int i = userMapper.updateImage(uimage, uid);
        if (i > 0){
            return new R(true);
        }else {
            return new R(false);
        }
    }

    /*根据 用户  id 查询 用户 个人信息*/

    @RequestMapping("/info")
    public R selectById(int uid){
        User user = userMapper.selectById(uid);
        if (user != null){
            return new R(true,user);
        }else {
            return new R(false);
        }
    }

    /*修改 用户 个人 信息*/

    @RequestMapping("/update")
    public R updateInfo(User user){
        int i = userMapper.updateInfo(user);
        if (i > 0){
            return new R(true);
        }else {
            return new R(false);
        }
    }

    /*根据 用户  phone 查询 所有用户信息*/

    @RequestMapping("/phone")
    public R selectByPhone(String uphone){
        List<User> users = userMapper.selectByPhone(uphone);
        if (users != null){
            return new R(true,users);
        }else {
            return new R(false);
        }
    }


    @RequestMapping("/updateNumber")
    public R updateNumber(int cnumber,int uid,int cid){
        int i = userMapper.updateNumber(cnumber,uid,cid);
        if (i > 0){
            return new R(true);
        }else {
            return new R(false);
        }
    }

    @RequestMapping("/updatePrice")
    public R updatePrice(double uprice,int uid){
        int i = userMapper.updataPrice(uprice,uid);
        if (i > 0){
            return new R(true);
        }else {
            return new R(false);
        }
    }

    /*查看 所有 用户 信息*/

    @RequestMapping("/list")
    public R selectAll(){
        List<User> users = userMapper.selectAll();

        if (users != null){
            return new R(true,users);
        }else {
            return new R(false);
        }
    }

    /*解冻 用户*/

    @RequestMapping("/thaw")
    public R openFreeze(int uid){
        int i = userMapper.openFreeze(1, uid);
        if (i > 0){
            return new R(true);
        }else {
            return new R(false);
        }
    }




}

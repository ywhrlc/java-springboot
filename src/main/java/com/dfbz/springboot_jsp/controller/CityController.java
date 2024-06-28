package com.dfbz.springboot_jsp.controller;

import com.dfbz.springboot_jsp.config.R;
import com.dfbz.springboot_jsp.mapper.CityMapper;
import com.dfbz.springboot_jsp.pojo.City;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/city")
public class CityController {
    @Autowired
    CityMapper cityMapper;

    @RequestMapping("/list")
    public R selectCityList(){
        List<City> cities = cityMapper.selectShowCity();
        return new R(true,cities);
    }

    @RequestMapping("/update")
    public R updateCityInfo(City city){
        int i = cityMapper.updateCityInfo(city);
        if (i > 0 ){
            return new R(true);
        }else {
            return new R(false);
        }
    }

    @RequestMapping("/delect")
    public R delectCityInfo(int city_id){
        int i = cityMapper.delectCityInfo(0,city_id);
        if (i > 0 ){
            return new R(true);
        }else {
            return new R(false);
        }
    }

    @RequestMapping("/add")
    public R addCityInfo(City city){
        int i = cityMapper.addCityInfo(city);
        if (i > 0 ){
            return new R(true);
        }else {
            return new R(false);
        }
    }

    @RequestMapping("/search")
    public R selectByName(String city_name){
        List<City> cities = cityMapper.selectByName(city_name);
        if (cities!= null){
            return new R(true,cities);
        }else {
            return new R(false);
        }
    }

    @RequestMapping("/content")
    public R selectById(int city_id){
        City city = cityMapper.selectById(city_id);
        if (city!=null){
            return new R(true,city);
        }else {
            return new R(false);
        }
    }

}

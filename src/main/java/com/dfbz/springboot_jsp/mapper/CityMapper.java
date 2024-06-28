package com.dfbz.springboot_jsp.mapper;

import com.dfbz.springboot_jsp.pojo.City;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface CityMapper {

    /*查询 所有 city 信息*/

    @Select("select * from t_city")
    public List<City> selectShowCity();

    /*根据 city_id 修改 city 信息*/

    @Update("update t_city set city_name = #{city_name}, city_image = #{city_image},city_day = #{city_day},city_price = #{city_price},city_info = #{city_info} where city_id = #{city_id}")
    public int updateCityInfo(City city);

    /*根据 city_id 删除 city信息*/

//    @Delete("delete from t_city where city_id = #{city_id}")
//    public int delectCityInfo(int city_id);

    /*根据 city_id 逻辑 删除 city 的信息*/

    @Update("update t_city set city_deleted = #{city_deleted} where city_id = #{city_id}")
    public int delectCityInfo(@Param("city_deleted")int city_deleted,@Param("city_id")int city_id);

    /*添加 city 信息*/

    @Insert("insert into t_city (city_name,city_image,city_day,city_price,city_info) values (#{city_name},#{city_image},#{city_day},#{city_price},#{city_info})")
    public int addCityInfo(City city);

    /* 模糊 查询 city 信息*/

    @Select("select * from t_city where city_name like concat('%',#{city_name},'%')")
    public List<City> selectByName(String city_name);

    /*根据 city_id 查询 city信息*/

    @Select("select * from t_city where city_id = #{city_id}")
    public City selectById(int city_id);



}

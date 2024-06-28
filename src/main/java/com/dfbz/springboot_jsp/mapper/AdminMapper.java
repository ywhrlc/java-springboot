package com.dfbz.springboot_jsp.mapper;

import com.dfbz.springboot_jsp.pojo.Admin;
import com.dfbz.springboot_jsp.pojo.City;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface AdminMapper {

    /*添加admin 信息*/

    @Insert("insert into t_admin(aname,apass,aphone) values(#{aname},#{apass},#{aphone})")
    public int insertAdmin(Admin admin);

    /*根据用户名 密码 查询*/

    @Select("select * from t_admin where aname = #{aname} and apass = #{apass}")
    public Admin selectByNamePass(@Param("aname")String aname, @Param("apass")String apass);

    /*查看 所有 管理员 信息*/

    @Select("select * from t_admin ")
    public List<Admin> list();

    /*根据 aname 逻辑删除 admin信息*/

    @Update("update t_admin set adeleted = #{adeleted} where aname = #{aname}")
    public int deletedAdmin(@Param("adeleted")int adeleted,@Param("aname")String aname);

    /*根据 aid 修改 admin 信息*/

    @Update("update t_admin set aname = #{aname}, apass = #{apass},aphone = #{aphone} where aid = #{aid}")
    public int updateAdminInfo(Admin admin);





}

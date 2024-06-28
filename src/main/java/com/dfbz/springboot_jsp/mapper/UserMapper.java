package com.dfbz.springboot_jsp.mapper;

import com.dfbz.springboot_jsp.pojo.*;
import org.apache.ibatis.annotations.*;

import javax.jws.soap.SOAPBinding;
import java.util.List;

@Mapper
public interface UserMapper {

    /*添加user 信息*/

    @Insert("insert into t_user(uname,upass,uphone) values(#{uname},#{upass},#{uphone})")
    public int insertUser(User user);

    /*根据用户名 密码 查询*/

    @Select("select * from t_user where uname = #{uname} and upass = #{upass}")
    public User selectByNamePass(@Param("uname")String uname, @Param("upass")String upass);

    /*根据 uid 逻辑 删除 user 的信息*/

    @Update("update t_user set udeleted = #{udeleted} where uid = #{uid}")
    public int delectUserInfo(@Param("udeleted")int udeleted,@Param("uid")int uid);

    /*向 item 表 中 根据用户id 和 city_id 添加购买记录 */

    @Insert("insert into t_item(uid,cid) values(#{uid},#{cid})")
    public int addCityInfo(@Param("uid") int uid,@Param("cid")int cid);

    /*联合查询 根据 city_id 查询 city信息*/

    @Select("select * from t_city where city_id in (select  cid from t_item where  uid = #{uid})")
    public List<City> selectByUid(int uid);

    /*根据 cid 和 uid 在 item 表中 删除用户city信息 */

    @Delete("delete from t_item where uid = #{uid} and cid = #{cid}")
    public int delCity(@Param("uid") int uid,@Param("cid")int cid);


    /*用户 头像图片上传*/

    @Update("update t_user set uimage = #{uimage} where uid = #{uid}")
    public int updateImage(@Param("uimage")String uimage,@Param("uid")int uid);

    /*根据 id 查询 用户信息*/

    @Select("select * from t_user where uid = #{uid}")
    public User selectById(int uid);

    /* 修改 用户 个人 信息*/

    @Update("update t_user set uname = #{uname},upass = #{upass},uphone = #{uphone} where uid = #{uid}")
    public int updateInfo(User user);

    /*根据 电话号码 查询 所有用户*/

    @Select("select * from t_user where uphone = #{uphone}")
    public List<User> selectByPhone(String uphone);

    /*根据 cid 修改 item 中 的 cnumber 的次数 */

    @Update("update t_item set cnumber = #{cnumber} where uid = #{uid} and cid = #{cid}")
    public int updateNumber(@Param("cnumber") int cnumber,@Param("uid") int uid,@Param("cid") int cid);

    /*根据 cid 查看 t_item中 的 cnumber*/

   @Select("select * from t_item where uid = #{uid} and cid = #{cid}")
    public Item selectNumber(@Param("uid")int uid,@Param("cid")int cid);

   /*根据 uid 更新 uprice 的值*/

    @Update("update t_user set uprice = #{uprice} where uid = #{uid}")
    public int updataPrice(@Param("uprice") double uprice,@Param("uid")int uid);

    /*查看 所有 用户 信息*/

    @Select("select * from t_user ")
    public List<User> selectAll();

    /*根据 uid 逻辑 修改 user 的状态信息*/

    @Update("update t_user set udeleted = #{udeleted} where uid = #{uid}")
    public int openFreeze(@Param("udeleted")int udeleted,@Param("uid")int uid);
}

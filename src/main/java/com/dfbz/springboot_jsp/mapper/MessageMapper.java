package com.dfbz.springboot_jsp.mapper;

import com.dfbz.springboot_jsp.pojo.Message;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface MessageMapper {

    /*向 t_message 表中添加信息*/

    @Insert("insert into t_message(name,phone,message) values(#{name},#{phone},#{message})")
    public int addMessage(Message message);

    /*查看 t_message 表中的信息*/

    @Select("select * from t_message")
    public List<Message> list();

}

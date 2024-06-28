package com.dfbz.springboot_jsp.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    private int uid;
    private String uname;
    private String upass;
    private String uphone;
    private String umessage;
    private double uprice;
    private String uimage;
    private int udeleted;
    private List<City> citys;


}

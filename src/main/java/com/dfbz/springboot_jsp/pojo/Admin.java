package com.dfbz.springboot_jsp.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Admin {
    private int aid;
    private String aname;
    private String apass;
    private String aphone;
    private int adeleted;
}

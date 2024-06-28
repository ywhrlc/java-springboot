package com.dfbz.springboot_jsp.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Message {
    private int id;
    private String name;
    private String phone;
    private String message;
}

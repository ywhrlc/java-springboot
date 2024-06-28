package com.dfbz.springboot_jsp.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Item {
    private int uid;
    private int cid;
    private int cnumber;
}

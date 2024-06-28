package com.dfbz.springboot_jsp.config;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class R {
    private boolean flag;
    private Object data;


    public R(boolean flag) {
        this.flag = flag;
    }
}

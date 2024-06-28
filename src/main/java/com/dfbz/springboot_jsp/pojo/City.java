package com.dfbz.springboot_jsp.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class City {
    private int city_id;
    private String city_name;
    private String city_image;
    private int city_day;
    private double city_price;
    private String city_info;
    private int city_deleted;
    private Item item;
}

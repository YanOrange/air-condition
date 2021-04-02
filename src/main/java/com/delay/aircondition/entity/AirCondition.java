package com.delay.aircondition.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

/**
 * 空调
 * @Author 闫金柱
 * @create 2021-4-1 16:12
 */
@Entity
@Data
@Table(name = "t_air")
public class AirCondition {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)//自增长
    private Integer id;

    private String name;//空调名

    private Integer temperature;//温度

    private Integer mode;//模式 0制冷 1制热 2除湿

    @JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss",timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    private Date createTime;

}

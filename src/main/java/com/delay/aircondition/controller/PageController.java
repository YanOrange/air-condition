package com.delay.aircondition.controller;

import com.fasterxml.jackson.databind.ser.Serializers;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Author 闫金柱
 * @create 2021-4-1 14:06
 */
@Controller
@RequestMapping("page")
public class PageController extends BaseController {

    /**
     * 登录页面
     *
     * @return
     */
    @RequestMapping("login")
    public String login() {
        return "login";
    }

    /**
     * 欢迎页面
     *
     * @return
     */
    @RequestMapping("welcome")
    public String welcome() {
        return "welcome";
    }

    /**
     * 首页
     *
     * @return
     */
    @RequestMapping("index")
    public String index() {
        return "index";
    }

    /**
     * 新增用户
     *
     * @return
     */
    @RequestMapping("add")
    public String add(Integer status, Model model) {
        model.addAttribute("status", status);
        return "author/person-add";
    }

    /**
     * 退出登录
     *
     * @return
     */
    @RequestMapping("exit")
    public String exit() {

        getSession().removeAttribute("user");

        return "login";
    }

    /**
     * 前往管理员列表
     * @return
     */
    @RequestMapping("toAdmin")
    public String toAdmin(){
        return "admin/admin-list";
    }

    /**
     * 前往房间列表
     * @return
     */
    @RequestMapping("roomList")
    public String roomList(){
        return "room/room-list";
    }

    /**
     * 前往空调列表
     * @return
     */
    @RequestMapping("airList")
    public String airList(){
        return "air/air-list";
    }


    /**
     * 客户端首页
     * @return
     */
    @RequestMapping("home")
    public String home(){
        return "client/home";
    }
    /**
     * 添加空调
     * @return
     */
    @RequestMapping("addAir")
    public String addAir(){
        return "air/air-add";
    }

    /**
     * 添加房间
     * @return
     */
    @RequestMapping("addRoom")
    public String addRoom(){
        return "room/room-add";
    }



}

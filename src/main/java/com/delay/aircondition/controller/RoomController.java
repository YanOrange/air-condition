package com.delay.aircondition.controller;

import com.delay.aircondition.entity.Room;
import com.delay.aircondition.entity.User;
import com.delay.aircondition.service.AirConditionService;
import com.delay.aircondition.service.RoomService;
import com.delay.aircondition.utils.ExecuteResult;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

/**
 * @author 闫金柱
 * @date 2021-4-3 8:48
 */
@Controller
@RequestMapping("room")
public class RoomController {

    @Autowired
    RoomService roomService;
    @Autowired
    AirConditionService airConditionService;

    /**
     * 删除房间
     *
     * @return
     */
    @RequestMapping("delete")
    @ResponseBody
    public ExecuteResult delete(@RequestBody List<Integer> ids) {
        ids.stream().forEach(o -> {
            airConditionService.deleteByRoomId(o);
            roomService.deleteById(o);
        });
        return ExecuteResult.ok();
    }

    /**
     * 获取全部房间
     *
     * @return
     */
    @RequestMapping("getAll")
    @ResponseBody
    public ExecuteResult getAll() {
        List<Room> all = roomService.findAll();
        return ExecuteResult.ok(all);
    }

    /**
     * 添加房间
     *
     * @return
     */
    @RequestMapping("add")
    @ResponseBody
    public ExecuteResult add(@RequestBody Room room) {
        Room byName = roomService.findByName(room.getName());
        if (byName != null) {
            return ExecuteResult.fail(1, "该房间已存在");
        }
        room.setCreateTime(new Date());
        roomService.saveAndFlush(room);
        return ExecuteResult.ok();
    }

    /**
     * 更改房间
     *
     * @return
     */
    @RequestMapping("editInfo")
    @ResponseBody
    public ExecuteResult editInfo(@RequestBody Room room) {
        Room byId = roomService.findById(room.getId()).orElse(null);
        BeanUtils.copyProperties(room, byId, "createTime");
        roomService.saveAndFlush(byId);
        return ExecuteResult.ok();
    }

    /**
     * 更改房间页面
     *
     * @return
     */
    @RequestMapping("toEditRoom")
    public String toEditRoom(@RequestParam("roomId") Integer roomId, Model model) {

        Room byId = roomService.findById(roomId).orElse(null);
        model.addAttribute("lesson", byId);

        return "room/room-edit";
    }




}

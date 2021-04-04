package com.delay.aircondition.controller;

import com.delay.aircondition.entity.AirCondition;
import com.delay.aircondition.entity.Room;
import com.delay.aircondition.service.AirConditionService;
import com.delay.aircondition.utils.ExecuteResult;
import org.apache.commons.collections.CollectionUtils;
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
@RequestMapping("air")
public class AirConditionController {

    @Autowired
    AirConditionService airConditionService;

    /**
     * 添加空调
     * @return
     */
    @RequestMapping("add")
    @ResponseBody
    public ExecuteResult add(@RequestBody AirCondition airCondition) {
        AirCondition byName = airConditionService.findByNameAndRoomId(airCondition.getName(),airCondition.getRoom().getId());
        if (byName != null) {
            return ExecuteResult.fail(1, "该空调已存在");
        }
        airCondition.setMode(0);
        airCondition.setTemperature(18);
        airCondition.setCreateTime(new Date());
        airConditionService.saveAndFlush(airCondition);
        return ExecuteResult.ok();
    }

    /**
     * 删除空调
     * @param ids
     * @return
     */
    @RequestMapping("delete")
    @ResponseBody
    public ExecuteResult delete(@RequestBody List<Integer> ids) {
        if (CollectionUtils.isEmpty(ids)) {
            return ExecuteResult.fail(1, "未选择一列");
        }
        ids.stream().forEach(o -> {
            airConditionService.deleteById(o);
        });
        return ExecuteResult.ok();
    }

    /**
     * 全部空调页面
     *
     * @return
     */
    @RequestMapping("findAll")
    @ResponseBody
    public ExecuteResult findAll() {

        List<AirCondition> all = airConditionService.findAll();

        return ExecuteResult.ok(all);
    }

    /**
     * 更改空调页面
     *
     * @return
     */
    @RequestMapping("toEditAir")
    public String toEditAir(@RequestParam("airId") Integer airId, Model model) {

        AirCondition byId = airConditionService.findById(airId).orElse(null);
        model.addAttribute("air", byId);

        return "air/air-edit";
    }

    /**
     * 更改任务
     *
     * @return
     */
    @RequestMapping("editInfo")
    @ResponseBody
    public ExecuteResult editInfo(@RequestBody AirCondition air) {
        AirCondition byId = airConditionService.findById(air.getId()).orElse(null);
        BeanUtils.copyProperties(air, byId, "createTime","room");
        airConditionService.saveAndFlush(byId);
        return ExecuteResult.ok();
    }

    /**
     * 按房间找空调
     *
     * @return
     */
    @RequestMapping("findById")
    @ResponseBody
    public ExecuteResult findById(Integer roomId) {
        if(roomId.equals(0)){
            List<AirCondition> all = airConditionService.findAll();
            return ExecuteResult.ok(all);
        }
        List<AirCondition> list = airConditionService.findByRoomId(roomId);
        return ExecuteResult.ok(list);
    }

}

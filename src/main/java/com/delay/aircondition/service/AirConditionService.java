package com.delay.aircondition.service;

import com.delay.aircondition.entity.AirCondition;
import com.delay.aircondition.entity.Room;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * @Author 闫金柱
 * @create 2021-3-15 10:42
 */
public interface AirConditionService extends JpaRepository<AirCondition,Integer> {

    AirCondition findByNameAndRoomId(String name, Integer id);

    void deleteByRoomId(Integer o);

    List<AirCondition> findByRoomId(Integer roomId);
}

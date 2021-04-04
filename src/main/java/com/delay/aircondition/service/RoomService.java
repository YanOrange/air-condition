package com.delay.aircondition.service;

import com.delay.aircondition.entity.Room;
import com.delay.aircondition.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @Author 闫金柱
 * @create 2021-3-15 10:42
 */
public interface RoomService extends JpaRepository<Room,Integer> {

    Room findByName(String name);
}

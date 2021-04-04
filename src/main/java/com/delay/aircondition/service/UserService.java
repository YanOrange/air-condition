package com.delay.aircondition.service;

import com.delay.aircondition.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * @Author 闫金柱
 * @create 2021-3-15 10:42
 */
public interface UserService extends JpaRepository<User,Integer> {

    User findByAccountAndPassWord(String userName, String passWord);

    List<User> findAllByStatus(Integer status);

    User findByAccount(String account);
}

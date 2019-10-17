package pers.shengzy.service;

import pers.shengzy.domain.SysUser;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;


public interface UserService extends UserDetailsService{
    /**
     * find all users
     * @return
     */
    List<SysUser> findAll();

    /**
     * save user
     * @param user
     */
    void save(SysUser user);

    /**
     * check if it the username is unique
     * @param username
     * @return
     */
    boolean isUniqueUsername(String username);

    /**
     * find by id
     * @param userId
     * @return
     */
    SysUser findById(Integer userId);

    /**
     * all a list of roles to a user
     * @param userId
     * @param ids
     */
    void addRolesToUser(Integer userId, Integer[] ids);
}

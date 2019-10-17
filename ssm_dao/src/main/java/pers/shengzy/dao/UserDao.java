package pers.shengzy.dao;

import pers.shengzy.domain.SysUser;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;

import java.util.List;


public interface UserDao {
    //find user by his username
    @Select("select * from sys_user where username = #{username} and status=1")
    @Results({
            @Result(property = "id",column = "id"),
            @Result(property = "roleList", column = "id",javaType = List.class,
                    // RoleDao.findRoleListByUserId(id)
                    many = @Many(select = "RoleDao.findRoleListByUserId",fetchType = FetchType.LAZY))
    })
    SysUser findByUsername(String username);

    /**
     * find all users
     * @return
     */
    @Select("select * from sys_user")
    List<SysUser> findAll();

    /**
     * save a user
     * @param user
     */
    @Insert("insert into sys_user values(user_seq.nextval,#{username},#{email},#{password},#{phoneNum},#{status})")
    void save(SysUser user);

    /**
     * find all users by a username
     * @param username
     * @return
     */
    @Select("select * from sys_user where username = #{username}")
    SysUser findAllUsersByUsername(String username);

    /**
     * find user by id
     * @param userId
     * @return
     */
    @Select("select * from sys_user where id = #{userId}")
    @Results({
            @Result(property = "id",column = "id"),
            @Result(property = "roleList", column = "id",javaType = List.class,
            // RoleDao.findRoleListByUserId(id)
            many = @Many(select = "RoleDao.findRoleListByUserId",fetchType = FetchType.LAZY))
    })
    SysUser findById(Integer userId);

    /**
     * delete all roles of a user
     * @param userId
     */
    @Delete("delete from sys_user_role where userId = #{userId}")
    void delRolesFromUser(Integer userId);

    /**
     * assign a role to a user
     * @param userId
     * @param roleId
     */
    @Insert("insert into sys_user_role values(#{param1},#{param2})")
    void saveRoleToUser(Integer userId, Integer roleId);
}

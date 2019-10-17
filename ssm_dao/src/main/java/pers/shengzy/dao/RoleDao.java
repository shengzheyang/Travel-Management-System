package pers.shengzy.dao;

import pers.shengzy.domain.Role;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;

import java.util.List;


public interface RoleDao {
    /**
     * find all roles
     * @return
     */
    @Select("select * from sys_role")
    List<Role> findAll();

    /**
     * save a role
     * @param role
     */
    @Insert("insert into sys_role values(role_seq.nextval, #{roleName},#{roleDesc})")
    void save(Role role);

    /**
     * find the list of roles given userid
     * @param userId
     * @return
     */
    @Select("select r.* from sys_user_role ur, sys_role r where r.id = ur.roleId and userId = #{userId}")
    @Results({
            @Result(property = "id",column = "id"),
            @Result(property = "permissionList", column = "id",javaType = List.class,
            many = @Many(select = "PermissionDao.findPermissionListByRoleId",fetchType = FetchType.LAZY))
    })
    public List<Role> findRoleListByUserId(Integer userId);

    /**
     * find role by id
     * @param roleId
     * @return
     */
    @Select("select * from sys_role where id = #{roleId}")
    @Results({
            @Result(property = "id",column = "id"),
            @Result(property = "permissionList", column = "id",javaType = List.class,
                    many = @Many(select = "PermissionDao.findPermissionListByRoleId",fetchType = FetchType.LAZY))
    })
    Role findById(Integer roleId);

    /**
     * delete all permissions from a role
     * @param roleId
     */
    @Delete("delete from sys_role_permission where roleId = #{roleId}")
    void delPermissionsFromRole(Integer roleId);

    /**
     * grant the role a new permission
     * @param roleId
     * @param permissionId
     */
    @Insert("insert into sys_role_permission values(#{param2},#{param1})")
    void addPermissionToRole(Integer roleId, Integer permissionId);
}

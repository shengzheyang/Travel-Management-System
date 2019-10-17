package pers.shengzy.dao;

import pers.shengzy.domain.Permission;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;


public interface PermissionDao {
    /**
     * find all permission levels
     * @return
     */
    @Select("select * from sys_permission")
    List<Permission> findAll();

    /**
     * find all parent permissions
     * @return
     */
    @Select("select * from sys_permission where pid = 0")
    List<Permission> findAllParentPermission();

    /**
     * save the permission
     * @param permission
     */
    @Insert("insert into sys_permission values(permission_seq.nextval,#{permissionName},#{url},#{pid})")
    void save(Permission permission);

    /**
     * find permission list base on the id of a role
     * @param roleId
     * @return
     */
    @Select("select p.*  from sys_role_permission rp, sys_permission p where rp.permissionid = p.id and roleId = #{roleId}")
    public List<Permission> findPermissionListByRoleId(Integer roleId);
}

package pers.shengzy.service;

import pers.shengzy.domain.Role;

import java.util.List;

public interface RoleService {
    /**
     * find all roles
     * @return
     */
    List<Role> findAll();

    /**
     * save a role
     * @param role
     */
    void save(Role role);

    /**
     * find a role by id
     * @param roleId
     * @return
     */
    Role findById(Integer roleId);

    /**
     * add permission to a role
     * @param roleId
     * @param ids
     */
    void addPermissionsToRole(Integer roleId, Integer[] ids);
}

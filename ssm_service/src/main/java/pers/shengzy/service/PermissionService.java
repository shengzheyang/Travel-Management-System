package pers.shengzy.service;

import pers.shengzy.domain.Permission;

import java.util.List;


public interface PermissionService {
    /**
     * find all permissions
     * @return
     */
    List<Permission> findAll();

    /**
     * find all parent permissions
     * @return
     */
    List<Permission> findAllParentPermission();

    /**
     * save a permission
     * @param permission
     */
    void save(Permission permission);
}

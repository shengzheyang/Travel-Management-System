package pers.shengzy.service.impl;

import pers.shengzy.dao.RoleDao;
import pers.shengzy.domain.Role;
import pers.shengzy.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    RoleDao roleDao;

    @Override
    public List<Role> findAll() {
        return roleDao.findAll();
    }

    @Override
    public void save(Role role) {
        roleDao.save(role);
    }

    @Override
    public Role findById(Integer roleId) {
        return roleDao.findById(roleId);
    }

    @Override
    public void addPermissionsToRole(Integer roleId, Integer[] ids) {
        //1. delete all permissions from role
        roleDao.delPermissionsFromRole(roleId);
        //2. manage new permissions
        if (ids != null){
            for (Integer permissionId : ids) {
                roleDao.addPermissionToRole(roleId ,permissionId);
            }
        }
    }
}

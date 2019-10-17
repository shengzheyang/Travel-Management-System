package pers.shengzy.controller;

import pers.shengzy.domain.Permission;
import pers.shengzy.domain.Role;
import pers.shengzy.service.PermissionService;
import pers.shengzy.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/role")
@Secured({"ROLE_ADMIN"})
public class RoleController {

    @Autowired
    PermissionService permissionService;

    @Autowired
    RoleService roleService;

    /**
     * find all roles
     * @return
     */
    @RequestMapping("/findAll")
    public ModelAndView findAll(){
        List<Role> roleList = roleService.findAll();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("roleList",roleList);
        modelAndView.setViewName("role-list");
        return modelAndView;
    }

    /**
     * save a role
     * @param role
     * @return
     */
    @RequestMapping("/save")
    public String save(Role role){
        roleService.save(role);
        return "redirect:/role/findAll";
    }

    /**
     * add permissions to a role and show it afterwards
     * @param roleId
     * @return
     */
    @RequestMapping("/addPermissionsToRoleUI")
    public ModelAndView addPermissionsToRoleUI(Integer roleId){
        List<Permission> permissionList = permissionService.findAll();
        Role role = roleService.findById(roleId);
        //build a string with the permissions a role already owns
        StringBuffer  sb = new StringBuffer();
        for (Permission permission : role.getPermissionList()) {
            sb.append(",");
            sb.append(permission.getId());
            sb.append(",");
        }

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("permissionList", permissionList);
        modelAndView.addObject("str", sb.toString());
        modelAndView.addObject("roleId", role.getId());
        modelAndView.setViewName("role-permission-add");
        return modelAndView;
    }

    /**
     *  add permissions to a role
     * @return
     */
    @RequestMapping("/addPermissionsToRole")
    public String addPermissionsToRole(Integer roleId, Integer[] ids){
        roleService.addPermissionsToRole(roleId, ids);
        return "redirect:/role/findAll";
    }
}

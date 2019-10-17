package pers.shengzy.controller;

import pers.shengzy.domain.Permission;
import pers.shengzy.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;


@Controller
@RequestMapping("/permission")
@Secured({"ROLE_ADMIN"})
public class PermissionController {

    @Autowired
    PermissionService permissionService;

    /**
     * find all permissions
     * @return
     */
    @RequestMapping("/findAll")
    public ModelAndView findAll(){
        List<Permission> permissionList =  permissionService.findAll();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("permissionList",permissionList);
        modelAndView.setViewName("permission-list");
        return modelAndView;
    }

    /**
     *  add a permission
     * @return
     */
    @RequestMapping("/saveUI")
    public ModelAndView saveUI(){
        List<Permission> permissionList =  permissionService.findAllParentPermission();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("permissionList",permissionList);
        modelAndView.setViewName("permission-add");
        return modelAndView;
    }

    /**
     * save a permission
     * @param permission
     * @return
     */
    @RequestMapping("/save")
    public String save(Permission permission){
        permissionService.save(permission);
        return "redirect:/permission/findAll";
    }
}

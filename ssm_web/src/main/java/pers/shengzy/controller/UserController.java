package pers.shengzy.controller;

import pers.shengzy.domain.Role;
import pers.shengzy.domain.SysUser;
import pers.shengzy.service.RoleService;
import pers.shengzy.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/user")
@Secured({"ROLE_ADMIN"})
public class UserController {

    @Autowired
    RoleService roleService;

    @Autowired
    UserService userService;

    @RequestMapping("/findAll")
    public ModelAndView findAll(){
        List<SysUser> userList = userService.findAll();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("userList",userList);
        modelAndView.setViewName("user-list");
        return modelAndView;
    }

    /**
     * save user
     * @param user
     * @return
     */
    @RequestMapping("/save")
    public String save(SysUser user){
        userService.save(user);
        return "redirect:/user/findAll";
    }

    /**
     * check username is unique
     *
     * @ResponseBody: return result set as json
     * @param username
     * @return
     */
    @RequestMapping("/isUniqueUsername")
    @ResponseBody
    public String isUniqueUsername(String username){
        boolean b = userService.isUniqueUsername(username);
        return String.valueOf(b);
    }

    /**
     * find details of a user
     * @param userId
     * @return
     */
    @RequestMapping("/details")
    public ModelAndView details(Integer userId){
        SysUser user = userService.findById(userId);
        System.out.println(user);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("user",user);
        modelAndView.setViewName("user-show");

        return modelAndView;
    }

    /**
     * add a role to user and shows afterwards
     * @param userId
     * @return
     */
    @RequestMapping("/addRoleToUserUI")
    public ModelAndView addRoleToUserUI(Integer userId){
        List<Role> roleList = roleService.findAll();
        SysUser user = userService.findById(userId);
        List<Role> userWithRoleList = user.getRoleList();
        //build a string with all roles the user owns
        // str = ,1,,2,,3,,4,,5,,6,,12,    ,1,
        StringBuffer sb = new StringBuffer();
        for (Role role : userWithRoleList) {
            sb.append(",");
            sb.append(role.getId());
            sb.append(",");
        }

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("roleList",roleList);
        modelAndView.addObject("str",sb.toString());
        modelAndView.addObject("userId", user.getId() );
        modelAndView.setViewName("user-role-add");
        return modelAndView;
    }

    /**
     * add roles to a user
     * @return
     */
    @RequestMapping("/addRolesToUser")
    public String addRolesToUser(Integer userId, Integer[] ids){
        userService.addRolesToUser(userId ,ids);
        return "redirect:/user/findAll";

    }
}

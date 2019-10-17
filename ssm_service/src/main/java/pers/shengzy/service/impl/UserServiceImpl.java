package pers.shengzy.service.impl;

import pers.shengzy.dao.UserDao;
import pers.shengzy.domain.Role;
import pers.shengzy.domain.SysUser;
import pers.shengzy.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;


@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    UserDao userDao;
    @Autowired
    PasswordEncoder passwordEncoder;

    /**
     * get user object by username
     * create a detailed user object
     * @param username
     * @return UserDetails
     * @throws UsernameNotFoundException
     */
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        //find SysUser object by username
        SysUser sysUser = userDao.findByUsername(username);
        if(sysUser != null){
            Collection<GrantedAuthority> authorities = new ArrayList<>();
            for (Role role : sysUser.getRoleList()) {
                GrantedAuthority grantedAuthority = new SimpleGrantedAuthority("ROLE_"+ role.getRoleName());
                authorities.add(grantedAuthority);
            }
            /**
             * param1: username
             * param2：password
             * param3: role list object
             */
            UserDetails user = new User(sysUser.getUsername(),sysUser.getPassword(), authorities);

            return user;
        }
        return  null;
    }

    @Override
    public List<SysUser> findAll() {

        return userDao.findAll();
    }

    @Override
    public void save(SysUser user) {
        //get password in plaintext
        String password = user.getPassword();
        //encrypt the password
        String securityPassword = passwordEncoder.encode(password);
        //store encrypted password into user object
        user.setPassword(securityPassword);
        userDao.save(user);
    }

    @Override
    public boolean isUniqueUsername(String username) {
        SysUser user = userDao.findAllUsersByUsername(username);
        //if user==null, username is usable, return true
        //if user!=null，username is taken, rerurn false
        return user == null;
    }

    @Override
    public SysUser findById(Integer userId) {
        return userDao.findById(userId);
    }

    @Override
    public void addRolesToUser(Integer userId, Integer[] ids) {
        //delete all roles from the user
        userDao.delRolesFromUser(userId);
        //set up new roles
        if(ids != null){
            for (Integer roleId : ids) {
                userDao.saveRoleToUser(userId,roleId);
            }
        }
    }
}

package pers.shengzy.controller;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Enumeration;

@Controller
public class ShowUsernameController {
    /**
     * show username
     */
    @RequestMapping("/showUsername")
    public void showUsername(HttpServletRequest request){
        //get session object
        HttpSession session = request.getSession();
        //get login info from session
        //get all attribute names from session
        Enumeration attributeNames = session.getAttributeNames();

        while(attributeNames.hasMoreElements()){
            System.out.println(attributeNames.nextElement());
        }
        //SPRING_SECURITY_CONTEXT : stores login info of users
        Object spring_security_context = session.getAttribute("SPRING_SECURITY_CONTEXT");
//        System.out.println(spring_security_context);
        //get SecurityContext object (from the security framework)
        SecurityContext securityContext = (SecurityContext) spring_security_context;
        // get authentication
        Authentication authentication = securityContext.getAuthentication();
        //Principal: get UserDetails
        Object principal = authentication.getPrincipal();
        User user = (User) principal;
        //get usernames
        String username = user.getUsername();
        System.out.println(username);


        //alternative way to get securityContext
        SecurityContext context = SecurityContextHolder.getContext();
        System.out.println(securityContext == context);

    }
}

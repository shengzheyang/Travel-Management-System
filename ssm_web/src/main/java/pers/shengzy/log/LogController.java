package pers.shengzy.log;

import pers.shengzy.domain.SysLog;
import pers.shengzy.service.LogService;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;


@Component
@Aspect
public class LogController {

    @Autowired
    LogService logService;


    @Autowired
    HttpServletRequest request;

    /**
     * pointcut
     */
    @Pointcut("execution(* com.itheima.controller.*.*(..))")
    public void pointcut(){};

    @Around("pointcut()")
    public Object around(ProceedingJoinPoint  joinPoint){
        //create log object
        SysLog log = new SysLog();
        //encapsulate date object
        //1. private String visitTime;
        log.setVisitTime(new Date());
        //2. private String username;
        //get securityContext object
        SecurityContext securityContext = SecurityContextHolder.getContext();
        //get authentication object
        Authentication authentication = securityContext.getAuthentication();
        //get user object
        User user = (User) authentication.getPrincipal();
        //get username
        String username = user.getUsername();
        log.setUsername(username);
        //3. private String ip;
        //get ip address
        String ip = request.getRemoteAddr();
        log.setIp(ip);
        //4. private String method;
        //intercepted object
        Object target = joinPoint.getTarget();
        //name of the intercepted object
        String className = target.getClass().getName();
        //get intercepted method
        Signature signature = joinPoint.getSignature();
        //name of the intercepted method
        String methodName = signature.getName();
        log.setMethod(className +"."+ methodName);
        //store log into the database

        logService.save(log);

        try {
            //execute the original function
            return joinPoint.proceed();
        } catch (Throwable throwable) {

            throwable.printStackTrace();
        }
        return null;
    }

}

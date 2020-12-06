package wen.blog.realm;

import java.util.HashSet;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.util.StringUtils;

import wen.blog.pojo.Blogger;
import wen.blog.service.BloggerService;

import javax.annotation.Resource;

public class BloggerRealm extends AuthorizingRealm {

    @Resource
    private BloggerService bloggerService;

    /**
     * 为当前登陆的用户授予角色和权限
     *
     * @param
     * @return
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
       String username = (String) principals.getPrimaryPrincipal();
       Blogger dbUser  = bloggerService.findBloggerByUsername(username);
       if(dbUser == null){
           return null;
       }
       String role = dbUser.getRole();
       if(StringUtils.isEmpty(role)){
           return null;
       }
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
       String[] split = role.split(",");
       //设置权限
        HashSet<String> roles = new HashSet<>();
        for(String s : split){
            roles.add(s);
        }
        //设置我们的权限
        authorizationInfo.setRoles(roles);
        return authorizationInfo;
    }

    /**
     * 身份认证
     *
     * @param authenticationToken
     * @return
     * @throws AuthenticationException
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {

        String username = (String) authenticationToken.getPrincipal();
        Blogger blogger = bloggerService.getBloggerByUsername(username);

        if (blogger != null) {
            //把当前用户存到session中
            SecurityUtils.getSubject().getSession().setAttribute("userName", blogger.getUsername());
            return new SimpleAuthenticationInfo(blogger.getUsername(),blogger.getPassword(),"BloggerRealm");
        } else {
            return null;
        }
    }

}
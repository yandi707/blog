package wen.blog.realm;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import wen.blog.pojo.Blogger;
import wen.blog.service.BloggerService;

import javax.annotation.Resource;

public class BloggerRealm extends AuthorizingRealm {

    @Resource
    private BloggerService bloggerService;

    /**
     * 为当前登陆的用户授予角色和权限
     *
     * @param principalCollection
     * @return
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        //因为是个人博客 所以不存在角色权限
        return null;
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
            SecurityUtils.getSubject().getSession().setAttribute("currentUser", blogger);
            return new SimpleAuthenticationInfo(blogger.getUsername(),blogger.getPassword(),"BloggerRealm");
        } else {
            return null;
        }
    }

}
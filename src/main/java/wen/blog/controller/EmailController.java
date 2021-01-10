package wen.blog.controller;

import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import wen.blog.pojo.Email;

@Controller
public class EmailController {

    // 给作者发送邮箱
    @ResponseBody
    @RequestMapping(value = "/sendEmail")
    public boolean sendEmail(@RequestBody Email email) {
        if (email.getAuth().equals("")) {
            return false;
        } else {
            System.out.println(email.toString());

            JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
            mailSender.setHost("smtp.qq.com");
            mailSender.setPort(587);
            mailSender.setUsername("1337991430@qq.com");
            mailSender.setPassword("tlngmynzumgqfjib");

            // 邮件信息
            SimpleMailMessage msg = new SimpleMailMessage();
            msg.setFrom(email.getSender()); // 发件人邮箱
            msg.setTo("1337991430@qq.com"); // 收件人邮箱
            msg.setSubject(email.getSubject()); // 标题
            msg.setText(email.getMessage()); // 文本信息
            try {
                mailSender.send(msg);
            } catch (MailException e) {
                System.err.println("发送失败:" + e.getMessage());
                return false;
            }
            return true;
        }
    }

}

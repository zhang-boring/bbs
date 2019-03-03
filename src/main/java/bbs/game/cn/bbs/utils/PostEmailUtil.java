package bbs.game.cn.bbs.utils;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.Properties;
import java.util.Random;

/**
 * @author 张宝运
 */
public class PostEmailUtil {
    //组成随机密码的字符
    private static final String PASSWORD = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

    public static String postEmail(String email) throws MessagingException {
        String myEmailAccount = "zhangbaoyun0@163.com";
        String myEmailPassword = "zhangbaoyun0";
        String mail163smtpHost = "smtp.163.com";
        String smtp163Port = "25";

        String recieveEmailAccount = email;

        //设置参数
        Properties p = new Properties();
        p.setProperty("mail.smtp.host", mail163smtpHost);
        p.setProperty("mail.smtp.port", smtp163Port);
        p.setProperty("mail.smtp.socketFactory.port", smtp163Port);
        p.setProperty("mail.smtp.auth", "true");
        p.setProperty("mail.smtp.socketFactory.class", "SSL_FACTORY");
        Session session = Session.getInstance(p, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(myEmailAccount, myEmailPassword);
            }
        });
        session.setDebug(true);
        System.out.println("创建邮件---");
        MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress(myEmailAccount));
        message.setRecipients(Message.RecipientType.TO, recieveEmailAccount);
        message.setRecipients(Message.RecipientType.CC, myEmailAccount);

        //随机生成6位密码
        Random random = new Random();
        String pw = "";
        for (int i = 0; i < 6; i ++) {
            pw += PASSWORD.charAt(random.nextInt(PASSWORD.length() - 1));
        }

        //发送邮件
        message.setSubject("找回密码邮件");
        message.setContent(
                "G&P 用户你好:<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
                        "您的随机新密码为:<span style='color:red;font-size:17px'>&nbsp;" +
                        pw + "&nbsp;</span>,请及时修改。<br><br>感谢注册使用，<br>来自G&P。", "text/html;charset=UTF-8");
        message.setSentDate(new Date());
        message.saveChanges();
        System.out.println("准备发送---");
        Transport.send(message);

        return pw;
    }
}

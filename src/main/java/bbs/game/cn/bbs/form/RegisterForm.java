package bbs.game.cn.bbs.form;

import lombok.Data;

import javax.validation.constraints.NotNull;
import java.sql.Date;

/**
 * @author 张宝运
 */
@Data
public class RegisterForm {
    /** 用户名 */
    @NotNull(message = "登录名或密码不能为空")
    private String uname;

    /** 密码 */
    @NotNull(message = "登录名或密码不能为空")
    private String password;

    /** 手机号 */
    private String phone = "";

    /** 邮箱 */
    @NotNull(message = "请输入邮箱用于找回密码")
    private String email;

    /** 头像图标 */
    private String icon;

    /** 个性签名 */
    private String signature = "";

    private String birthday;

    private Integer gender;

    public RegisterForm(String uname, String password, String phone, String email, String icon, String signature) {
        this.uname = uname;
        this.password = password;
        this.phone = phone;
        this.email = email;
        this.icon = icon;
        this.signature = signature;
    }
}

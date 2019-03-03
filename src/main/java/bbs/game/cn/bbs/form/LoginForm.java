package bbs.game.cn.bbs.form;

import lombok.Data;

import javax.validation.constraints.NotNull;

/**
 * @author 张宝运
 */
@Data
public class LoginForm {

    /** 用户登录凭证 */
    @NotNull(message = "用户名或密码为空")
    private String usercheck;

    /** 密码 */
    @NotNull(message = "用户名或密码为空")
    private String password;

    /** 验证类型 */
    private String logintype;

    /**
     * 隐身登录
     * 默认为0为不隐身
     * 1为隐身
     * 隐身不更新登录时间
     */
    private String hideid = "0";
}

package bbs.game.cn.bbs.form;

import lombok.Data;

@Data
public class ResetPasswordForm {
    private String oldpw;
    private String newpw;
    private String newpwre;
}

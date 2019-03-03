package bbs.game.cn.bbs.convert;

import bbs.game.cn.bbs.entity.UserEntity;
import bbs.game.cn.bbs.form.RegisterForm;
import org.springframework.beans.BeanUtils;

/**
 * 将用户注册页填写的信息转换格式为用户实体类
 * @author 张宝运
 */
public class RegisterForm2UserEntity {
    public static UserEntity convert(RegisterForm form) {
        UserEntity user = new UserEntity();
        BeanUtils.copyProperties(form, user);
        user.setIcon("../static/img/head/" + user.getIcon() + ".gif");
        return user;
    }
}

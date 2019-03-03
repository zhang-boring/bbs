package bbs.game.cn.bbs.convert;

import bbs.game.cn.bbs.dto.UserDTO;
import bbs.game.cn.bbs.entity.UserEntity;
import org.springframework.beans.BeanUtils;

/**
 * @author 张宝运
 */
public class UserEntity2UserDTO {

    public static UserDTO convert(UserEntity source) {
        if (source == null) {
            return null;
        }
        UserDTO target = new UserDTO();
        BeanUtils.copyProperties(source, target);
        return target;
    }
}

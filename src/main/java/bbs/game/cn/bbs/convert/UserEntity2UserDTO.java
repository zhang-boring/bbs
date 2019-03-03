package bbs.game.cn.bbs.convert;

import bbs.game.cn.bbs.dto.UserDTO;
import bbs.game.cn.bbs.entity.UserEntity;
import bbs.game.cn.bbs.repository.ForumRepository;
import bbs.game.cn.bbs.repository.UserRepository;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;

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

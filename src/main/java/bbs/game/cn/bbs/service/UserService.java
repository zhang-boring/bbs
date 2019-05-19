package bbs.game.cn.bbs.service;

import bbs.game.cn.bbs.dto.UserDTO;
import bbs.game.cn.bbs.entity.UserEntity;
import bbs.game.cn.bbs.form.LoginForm;
import bbs.game.cn.bbs.form.RegisterForm;

/**
 * @author 张宝运
 */
public interface UserService {
    UserEntity findUser(Long uid);
    UserDTO login(LoginForm form);
    String newestUname();
    Long usersTotal();
    void updateCheckinTime(Long uid);
    boolean findUserByUname(String uname);
    boolean findUserByEmail(String email);
    void getNewMessage(UserDTO userDTO);
    UserEntity register(RegisterForm userInfo);
    void getPostNum(UserDTO userDTO);
    void editSignature(Long uid, String sig);
    UserEntity repw(String email, String uname);
    void changePW(String uname, String pw);

    String findUsernameByUid(Long uid);
    String findUserIconByUid(Long uid);
    UserEntity modify(RegisterForm modifyForm, Long uid);
    boolean checkpw(Long uid, String passwd);
    void setPassword(Long uid, String newPw);
}

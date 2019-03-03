package bbs.game.cn.bbs.service.impl;

import bbs.game.cn.bbs.convert.RegisterForm2UserEntity;
import bbs.game.cn.bbs.convert.UserEntity2UserDTO;
import bbs.game.cn.bbs.dto.UserDTO;
import bbs.game.cn.bbs.entity.UserEntity;
import bbs.game.cn.bbs.form.LoginForm;
import bbs.game.cn.bbs.form.RegisterForm;
import bbs.game.cn.bbs.repository.ForumRepository;
import bbs.game.cn.bbs.repository.PostRepository;
import bbs.game.cn.bbs.repository.UserRepository;
import bbs.game.cn.bbs.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author 张宝运
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private PostRepository postRepository;
    @Autowired
    ForumRepository forumRepository;

    /**
     * 用户登录
     *  分用户名验证登录、uid验证登录、邮箱验证登陆
     * @param form
     * @return
     */
    @Override
    public UserDTO login(LoginForm form) {
        UserEntity userEntity = new UserEntity();
        switch (Integer.valueOf(form.getLogintype())) {
            case 0:
                userEntity = userRepository.findByUname(form.getUsercheck());
                break;
            case 1:
                userEntity = userRepository.findById(Long.valueOf(form.getUsercheck())).orElse(null);
                break;
            case 2:
                userEntity = userRepository.findByEmail(form.getUsercheck());
                break;
        }
        UserDTO userDTO = UserEntity2UserDTO.convert(userEntity);
        if (userEntity.getLevel() != 0) {
            String forumName = forumRepository.findForumnameByForumid(Long.valueOf(userEntity.getLevel()));
            userDTO.setLevel(forumName + "版主");
        }
        return userDTO;
    }

    /**
     * 最新注册的用户的用户名
     * @return
     */
    @Override
    public String newestUname() {
        String uname = userRepository.findFirstByOrderBySignUpTimeDesc().getUname();
        return uname;
    }

    /**
     * 社区内当前注册用户总量
     * @return
     */
    @Override
    public Long usersTotal(){
        Long userNum = userRepository.count();
        return userNum;
    }

    /**
     * 更新最后登入时间，隐身登陆则不更新
     * @param uid
     */
    @Override
    public void updateCheckinTime(Long uid) {
        userRepository.updateCheckinTime(uid);
    }

    /**
     * 查询数据库中是否有该用户名
     * @param uname
     * @return
     */
    @Override
    public boolean findUserByUname(String uname) {
        if (uname == null) {
            return false;
        }
        System.out.println("uname:" + uname);
        //使用变量uname，查出来的总是空值，使用同等的"12355"，就可以查出来？？？？
        UserEntity result = userRepository.findByUname(uname);
        System.out.println(result);
        if (result != null) {
            return true;
        }
        return false;
    }

    /**
     * 查询数据库中是否有该邮箱
     * @param email
     * @return
     */
    @Override
    public boolean findUserByEmail(String email) {
        if (email == null) {
            return false;
        }
        if (userRepository.findByEmail(email) != null) {
            return true;
        }
        return false;
    }

    /**
     * 用户登录时，获取离线新消息数
     * TODO
     * @param userDTO
     */
    @Override
    public void getNewMessage(UserDTO userDTO) {
        userDTO.setMessage("5");
    }

    /**
     * 用户注册，将用户注册页填写的信息转换为用户尸体类型，然后save进数据库
     * @param userInfo
     * @return
     */
    @Override
    public UserEntity register(RegisterForm userInfo) {
        UserEntity userEntity = RegisterForm2UserEntity.convert(userInfo);
        return userRepository.save(userEntity);
    }

    /**
     * 获取用户中文章数
     * @param userDTO
     */
    @Override
    public void getPostNum(UserDTO userDTO) {
        userDTO.setPostnum(postRepository.countAllByUid(userDTO.getUid()));
    }

    /**
     * 编辑用户签名
     * @param uid
     * @param sig
     */
    @Override
    public void editSignature(Long uid, String sig) {
        userRepository.updateSignatureByUid(uid, sig);
    }

    /**
     * 找回密码时验证用户输入数据
     * @param email
     * @param uname
     * @return
     */
    @Override
    public UserEntity repw(String email, String uname) {
        return userRepository.findByEmailAndUname(email, uname);
    }

    /**
     * 修改密码
     * @param uname
     * @param pw
     */
    @Override
    public void changePW(String uname, String pw) {
        userRepository.updatePassordByUname(uname, pw);
    }
}

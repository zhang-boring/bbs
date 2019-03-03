package bbs.game.cn.bbs.dto;

import lombok.Data;

/**
 * 前台显示用户信息，数据传输对象类型
 * @author 张宝运
 */
@Data
public class UserDTO {
    private long uid;
    private String uname;
    private String email;
    private String phone;
    private String icon;
    private String signature;
    /** 离线新消息数 */
    private String message;
    private long postnum;
    private String level;

    public UserDTO() {

    }
}

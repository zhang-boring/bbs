package bbs.game.cn.bbs.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * 前台显示用户信息，数据传输对象类型
 * @author 张宝运
 */
@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
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
    private String level = "普通会员";
    private String birthday;
    private int gender;
}

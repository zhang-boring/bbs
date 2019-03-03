package bbs.game.cn.bbs.dto;

import lombok.Data;

/**
 * 主页显示伙伴段的基本数据，数据传输内容对象
 * @author 张宝运
 */
@Data
public class HomePageDTO {
    /* 今日新帖 */
    private Integer today;
    /* 版块数 */
    private Integer forums;
    /* 总帖子数 */
    private Integer posts;
    /* 总注册用户量 */
    private Integer users;
    /* 最新注册用户名 */
    private String newest;

    /* 最新公告帖子标题 */
    private String postname;

    public HomePageDTO() {

    }

    public HomePageDTO(Integer today, Integer forums, Integer posts, Integer users, String newest, String postname) {
        this.today = today;
        this.forums = forums;
        this.posts = posts;
        this.users = users;
        this.newest = newest;
        this.postname = postname;
    }
}

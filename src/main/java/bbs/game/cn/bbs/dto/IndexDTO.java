package bbs.game.cn.bbs.dto;

import lombok.Data;

import java.math.BigInteger;

/**
 * @author 张宝运
 */
@Data
public class IndexDTO {
    /**
     * header页面基本信息
     *  帖子总数
     *  今日新帖
     *  昨日帖子数
     *  单日新帖最高数量
     *  最新注册用户名
     *  总注册用户数
     *  板块总数
    */
    private Long posts;
    private Long today;
    private Long yestoday;
    private String mostday;
    private String newest;
    private Long users;
    private Long forums;
    /**
     * 首页公告栏信息
     *  最新公告贴标题
     *  公告贴id
     */
    private String announceName;
    private BigInteger announceId;

    public IndexDTO() {
    }

    public IndexDTO(Long posts, Long today, Long yestoday, String mostday, String newest, Long users, Long forums, String announceName, BigInteger announceId) {
        this.posts = posts;
        this.today = today;
        this.yestoday = yestoday;
        this.mostday = mostday;
        this.newest = newest;
        this.users = users;
        this.forums = forums;
        this.announceName = announceName;
        this.announceId = announceId;
    }
}

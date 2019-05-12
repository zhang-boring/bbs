package bbs.game.cn.bbs.dto;

import lombok.Data;

import java.sql.Timestamp;

/**
 * 首页显示版块，数据传输对象类型
 * @author 张宝运
 */
@Data
public class ForumDTO {
    /* 所属区id */
    private Long partid;
    /* 版块id */
    private Long forumid;
    /* 版块名称 */
    private String forumname;
    /* 版主用户名，注:在数据库中存储为版主uid */
    private String moderator = "0";
    private String moderatorName = "";
    /* 版块描述 */
    private String description;
    private Timestamp createtime;
    /* 图标链接 */
    private String icon;
    /* 当前版块新帖数量 */
    private String newPosts;
    /* 当前版块帖子总量 */
    private Long allPosts;
    /* 当前版块今日新帖 */
    private String todayPosts;
    /* 当前板块最新发布的文章的id及标题、发布者、提交时间 */
    private Long postid;
    private String title;
    private String uname;
    private Timestamp committime;

    private String partname;

    public ForumDTO() {

    }

    public ForumDTO(Long partid, Long forumid, String forumname,
                    String moderator, String description, String icon,
                    String newPosts, Long allPosts, String todayPosts,
                    Long postid, String title) {
        this.partid = partid;
        this.forumid = forumid;
        this.forumname = forumname;
        this.moderator = moderator;
        this.description = description;
        this.icon = icon;
        this.newPosts = newPosts;
        this.allPosts = allPosts;
        this.todayPosts = todayPosts;
        this.postid = postid;
        this.title = title;
    }
}

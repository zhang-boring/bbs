package bbs.game.cn.bbs.dto;

import lombok.Data;

import java.sql.Timestamp;

/**
 * 文章数据传输对象：文章标题，文章id，发布人uname，发布时间
 * @author 张宝运
 */
@Data
public class PostDTO {
    //文章id
    private long postid;
    //文章标题
    private String title;
    //发布人uid、用户名
    private Long uid;
    private String uname;
    //发布时间
    private Timestamp committime;
    //最新回复
    private Timestamp lastchagetime;
    private String replyUname;
    //文章评论数
    private Long replyNum;

    public PostDTO() {
    }

    public PostDTO(long postid, String title, String uname, Timestamp committime,
                   Timestamp lastchagetime, String replyUname, Long replyNum) {
        this.postid = postid;
        this.title = title;
        this.uname = uname;
        this.committime = committime;
        this.lastchagetime = lastchagetime;
        this.replyUname = replyUname;
        this.replyNum = replyNum;
    }
}

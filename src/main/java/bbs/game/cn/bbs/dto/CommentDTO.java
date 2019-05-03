package bbs.game.cn.bbs.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class CommentDTO {
    private long commentid;
    private long postid;
    private long firstuid;
    private Long seconduid;
    private String comment;
    private Timestamp committime;

    private String uname;
    private String icon;
    private String signature;

    private String seconenduname;
}

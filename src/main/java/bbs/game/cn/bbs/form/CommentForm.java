package bbs.game.cn.bbs.form;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class CommentForm {

    private long firstuid;

    private long seconduid;

    private String atc_content;

    private long postid;
}

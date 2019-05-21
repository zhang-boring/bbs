package bbs.game.cn.bbs.form;

import lombok.Data;

import javax.validation.constraints.NotNull;

/**
 * 文章表单内容
 */
@Data
public class PostForm {

    @NotNull(message = "标题必填")
    private String title;

    private String content;

    private Integer announce;
}

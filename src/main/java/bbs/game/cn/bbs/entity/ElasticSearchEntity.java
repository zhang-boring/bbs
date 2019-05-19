package bbs.game.cn.bbs.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * easticsearch搜索实体类，包括文章id和文章标题
 * @author 张宝运
 */
@Data
public class ElasticSearchEntity implements Serializable {

    private static final long serialVersionUID = -731615988308523288L;

    public static final String INDEX_NAME = "elk_name";

    public static final String TYPE = "esType";

    private String content;

    public ElasticSearchEntity(String content) {
        this.content = content;
    }

    public ElasticSearchEntity() {}
}

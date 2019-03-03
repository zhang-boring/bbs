package bbs.game.cn.bbs.entity;

import java.io.Serializable;

/**
 * easticsearch搜索实体类，包括文章id和文章标题
 * @author 张宝运
 */
public class ElasticSearchEntity implements Serializable {

    private static final long serialVersionUID = -731615988308523288L;

    public static final String INDEX_NAME = "ELK_NAME";

    public static final String TYPE = "esType";

}

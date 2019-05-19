package bbs.game.cn.bbs.service;

import bbs.game.cn.bbs.dto.PostDTO;
import bbs.game.cn.bbs.entity.ElasticSearchEntity;
import bbs.game.cn.bbs.entity.EspostEntity;
import io.searchbox.client.JestResult;

import java.util.List;

public interface ESService {
    JestResult saveEntity(ElasticSearchEntity elasticSearchEntity);

    List<PostDTO> search(String searchContent);

    void delete(Long postid);

    void save2DB(EspostEntity entity);

    void deleteIndex(String indexName);
}

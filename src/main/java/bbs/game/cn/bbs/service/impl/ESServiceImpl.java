package bbs.game.cn.bbs.service.impl;

import bbs.game.cn.bbs.dto.PartDTO;
import bbs.game.cn.bbs.dto.PostDTO;
import bbs.game.cn.bbs.entity.ElasticSearchEntity;
import bbs.game.cn.bbs.entity.EspostEntity;
import bbs.game.cn.bbs.repository.ESRepository;
import bbs.game.cn.bbs.repository.PostRepository;
import bbs.game.cn.bbs.service.ESService;
import com.alibaba.fastjson.JSON;
import io.searchbox.client.JestClient;
import io.searchbox.client.JestResult;
import io.searchbox.core.Delete;
import io.searchbox.core.Index;
import io.searchbox.core.Search;
import io.searchbox.indices.DeleteIndex;
import org.elasticsearch.action.admin.indices.delete.DeleteIndexResponse;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.builder.SearchSourceBuilder;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Service
public class ESServiceImpl implements ESService {

    @Autowired
    private JestClient jestClient;
    @Autowired
    private ESRepository esRepository;
    @Autowired
    private PostRepository postRepository;

    @Override
    public JestResult saveEntity(ElasticSearchEntity elasticSearchEntity) {
        Index index = new Index.Builder(elasticSearchEntity).index(ElasticSearchEntity.INDEX_NAME).type(ElasticSearchEntity.TYPE).build();
        try {
            return jestClient.execute(index);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 在es中搜索信息
     * @param searchContent
     * @return
     */
    @Override
    public List<PostDTO> search(String searchContent) {
        SearchSourceBuilder searchSourceBuilder = new SearchSourceBuilder();
        searchSourceBuilder.query(QueryBuilders.matchQuery("content", searchContent));
        Search search = new Search.Builder(searchSourceBuilder.toString()).
                addIndex(ElasticSearchEntity.INDEX_NAME).addType(ElasticSearchEntity.TYPE).build();
        try {
            JestResult jestResult = jestClient.execute(search);
            ArrayList<PostDTO> postDTOS = new ArrayList<>();
            List<ElasticSearchEntity> elasticSearchEntities = jestResult.getSourceAsObjectList(ElasticSearchEntity.class);
            for (ElasticSearchEntity elasticSearchEntity : elasticSearchEntities) {
                postDTOS.add(JSON.parseObject(elasticSearchEntity.getContent(), PostDTO.class));
            }
            return postDTOS;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void delete(Long postid) {

    }

    @Override
    public void save2DB(EspostEntity entity) {
        esRepository.save(entity);
    }

    @Override
    public void deleteIndex(String indexName) {
        try {
            JestResult jestResult = jestClient.execute(new DeleteIndex.Builder(indexName).build());
            System.out.println("删除索引结果：" +jestResult.isSucceeded());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


}

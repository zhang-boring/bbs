package bbs.game.cn.bbs.listener;

import bbs.game.cn.bbs.dto.PostDTO;
import bbs.game.cn.bbs.entity.ElasticSearchEntity;
import bbs.game.cn.bbs.entity.EspostEntity;
import bbs.game.cn.bbs.service.ESService;
import bbs.game.cn.bbs.service.PostService;
import bbs.game.cn.bbs.service.impl.ESServiceImpl;
import bbs.game.cn.bbs.service.impl.PostServiceImpl;
import com.alibaba.fastjson.JSON;
import io.searchbox.client.JestResult;
import org.json.JSONObject;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;

import java.util.List;

public class ApplicationStartupListener implements ApplicationListener<ContextRefreshedEvent> {
    @Override
    public void onApplicationEvent(ContextRefreshedEvent contextRefreshedEvent) {
        ESService esService = contextRefreshedEvent.getApplicationContext().getBean(ESServiceImpl.class);
        PostService postService = contextRefreshedEvent.getApplicationContext().getBean(PostServiceImpl.class);

        esService.deleteIndex(ElasticSearchEntity.INDEX_NAME);

        List<PostDTO> postDTOS = postService.findAll();

        ElasticSearchEntity elasticSearchEntity = new ElasticSearchEntity();
        for (PostDTO postDTO : postDTOS) {
            elasticSearchEntity.setContent(JSON.toJSONString(postDTO));
            JestResult jestResult = esService.saveEntity(elasticSearchEntity);
            if (jestResult.getResponseCode() != 400) {
                JSONObject jsonObject = new JSONObject(jestResult.getJsonString());
                String es_id = jsonObject.getString("_id");
                EspostEntity espostEntity = new EspostEntity(postDTO.getPostid(), es_id);
                esService.save2DB(espostEntity);
            }
        }
    }
}

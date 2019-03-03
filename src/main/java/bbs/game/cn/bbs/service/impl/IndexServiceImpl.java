package bbs.game.cn.bbs.service.impl;

import bbs.game.cn.bbs.dto.IndexDTO;
import bbs.game.cn.bbs.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigInteger;

/**
 * @author 张宝运
 */
@Service
public class IndexServiceImpl implements IndexService {
    @Autowired
    UserService userService;
    @Autowired
    PartService partService;
    @Autowired
    ForumService forumService;
    @Autowired
    PostService postService;

    @Override
    public IndexDTO getIndexPageInfo() {
        Long postNum = postService.postsTotal();
        Long postsToday = postService.postsToday();
        Long postYestoday = postService.postYestoday();
        String postMostDay = postService.mostPostsDay();
        String uname = userService.newestUname();
        Long userNum = userService.usersTotal();
        Long forumNum = forumService.forumsTotal();
        String announceName = postService.newestAnnounceName();
        BigInteger announceId = postService.newestAnnounceId();

        IndexDTO indexDTO = new IndexDTO(
                postNum, postsToday, postYestoday,
                postMostDay, uname, userNum, forumNum,
                announceName, announceId);
        return indexDTO;
    }
}

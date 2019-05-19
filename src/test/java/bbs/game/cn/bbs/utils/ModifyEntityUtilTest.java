package bbs.game.cn.bbs.utils;

import bbs.game.cn.bbs.dto.SimpleForumDTO;
import org.junit.Test;

import static org.junit.Assert.*;

public class ModifyEntityUtilTest {

    @Test
    public void modifyTest() {
        SimpleForumDTO simpleForumDTO1 = new SimpleForumDTO((long) 1, "name1");
        SimpleForumDTO simpleForumDTO2 = new SimpleForumDTO((long) 1, null);
        ModifyEntityUtil.getModified(simpleForumDTO1, simpleForumDTO2);
        System.out.println(simpleForumDTO2);

    }
}
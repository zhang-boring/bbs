package bbs.game.cn.bbs.service.impl;

import bbs.game.cn.bbs.service.PartService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.Assert.*;

@SpringBootTest
@RunWith(SpringRunner.class)
public class PartServiceImplTest {

    @Autowired
    PartService partService;

    @Test
    public void getOtherPart() {
        System.out.println(partService.getOtherPart((long) 1));
    }
}
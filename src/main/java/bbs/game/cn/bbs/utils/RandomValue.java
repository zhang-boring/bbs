package bbs.game.cn.bbs.utils;

import java.util.Random;

/**
 * 获取随机数值、字符串、文件名等
 * @author 张宝运
 */
public class RandomValue {

    public static synchronized String getRandomFileName() {
        Random random = new Random();

        Integer number = random.nextInt(899999) + 100000;

        return System.currentTimeMillis() + number.toString();
    }
}

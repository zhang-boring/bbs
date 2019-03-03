package bbs.game.cn.bbs.utils;

import com.sun.prism.paint.Gradient;

import java.awt.*;
import java.awt.image.BufferedImage;
import java.util.Random;

/**
 * 图片验证码生成工具类
 * @author 张宝运
 */
public class ImageCodeUtil {
    /**
     * 验证码字符集
     */
    public static final char[] CHARS = {
            '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
            'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
            'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
            'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
            'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
    };
    /**
     * 验证码字符数量
     */
    private  static final int SIZE = 4;
    /**
     * 干扰线数量
     */
    private static final int LINES = 5;
    /**
     * 宽度
     */
    private static final int WIDTH = 100;
    /**
     * 高度
     */
    private static final int HEIGHT = 50;
    /**
     * 字体大小
     */
    private static final int FONTSIZE = 30;

    /**
     * 生成随即验证码及图片
     * Object[0]为验证码字符串:不区分大小写
     * Object[1]为验证码图片
     */
    public static Object[] createImage() {
        StringBuffer stringBuffer = new StringBuffer();
        //1.创建空白图片
        BufferedImage image = new BufferedImage(WIDTH, HEIGHT, BufferedImage.TYPE_INT_RGB);
        //2.获取图片画笔
        Graphics graphics = image.createGraphics();
        //3.设置画笔颜色
        graphics.setColor(Color.LIGHT_GRAY);
        //4.绘制矩形背景
        graphics.fillRect(0, 0, WIDTH, HEIGHT);
        //5.画随机字符
        Random random = new Random();
        for (int i = 0; i < SIZE; i ++) {
            //取随机字符索引
            int n = random.nextInt(CHARS.length);
            //设置随机颜色
            graphics.setColor(getRandomColor());
            //设置字体大小
            graphics.setFont(new Font(null, Font.BOLD + Font.ITALIC, FONTSIZE));
            //画字符
            graphics.drawString(CHARS[n] + "", i * WIDTH /SIZE, HEIGHT * 2 / 3);
            //记录字符
            stringBuffer.append(CHARS[n]);
        }
        //6.画干扰线
        for (int i = 0; i < LINES; i ++) {
            //设置随机颜色
            graphics.setColor(getRandomColor());
            //随机画线
            graphics.drawLine(random.nextInt(WIDTH), random.nextInt(HEIGHT),
                    random.nextInt(WIDTH), random.nextInt(HEIGHT));
        }
        System.out.println(stringBuffer.toString());
        //7.返回验证码和图片
        return new Object[]{stringBuffer.toString(), image};
    }

    /**
     * 获取随机颜色
     * @return
     */
    public static Color getRandomColor() {
        Random random = new Random();
        Color color = new Color(random.nextInt(256), random.nextInt(256), random.nextInt(256));
        return color;
    }
}

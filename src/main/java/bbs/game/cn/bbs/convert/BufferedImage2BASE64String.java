package bbs.game.cn.bbs.convert;

import sun.misc.BASE64Encoder;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;

/**
 * 将工具类生成的BufferedImage类的验证码图片转换为base64字符串格式，以便传输前台显示
 * @author 张宝运
 */
public class BufferedImage2BASE64String {
    public static String convert(BufferedImage bufferedImage) {
        try {
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            ImageIO.write(bufferedImage, "jpg", outputStream);
            BASE64Encoder encoder = new BASE64Encoder();
            String base64Str = encoder.encode(outputStream.toByteArray());
            return base64Str;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
}

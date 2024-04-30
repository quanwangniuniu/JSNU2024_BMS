package cn.edu.jsnu.util;

import java.awt.*;
import java.awt.image.BufferedImage;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

public class ImageUtil {
    private static final char[] chars=
            {'0','1','2','3','4','5','6','7','8','9'};

    private static final int SIZE=4;
    private static final int LINES=5;

    private static final int WIDTH=80;
    private static final int HEIGHT=40;

    private static final int FONT_SIZE=30;

    public static Map<String , BufferedImage>
                                createImage() {
        StringBuffer ss = new StringBuffer();
        BufferedImage image =
                new BufferedImage(WIDTH, HEIGHT,
                        BufferedImage.TYPE_INT_RGB);
        Graphics graphics = image.getGraphics();
        graphics.setColor(Color.LIGHT_GRAY);
        graphics.fillRect(0, 0, WIDTH, HEIGHT);
        Random random = new Random();
        for (int i = 1; i <= SIZE; i++) {
            int r = random.nextInt(chars.length);
            graphics.setColor(getRandomColor());
            graphics.setFont(new Font(null,
                    Font.BOLD
                            + Font.ITALIC, FONT_SIZE));
            graphics.drawString(
                    chars[r] + "",
                    (i - 1) * WIDTH / SIZE,
                    HEIGHT / 2 + 10);
            ss.append(chars[r]);
        }
            for (int i = 1; i <= LINES; i++) {
                graphics.setColor(getRandomColor());
                graphics.drawLine(random.nextInt(WIDTH),
                        random.nextInt(HEIGHT),
                        random.nextInt(WIDTH),
                        random.nextInt(HEIGHT));
            }
            Map<String, BufferedImage> map = new HashMap<>();
            map.put(ss.toString(), image);
            return map;
        }
  public static Color getRandomColor(){
        Random random=new Random();
        return new Color(
                random.nextInt(256),
                random.nextInt(256),
                random.nextInt(256));
  }
}

package com.home.core.util;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.imageio.ImageIO;

public class FileUtils {
	public static InputStream resizeImage(InputStream inputStream, int width, int height, String extension) throws IOException {
        BufferedImage sourceImage = ImageIO.read(inputStream);
        Image thumbnail = sourceImage.getScaledInstance(width, height, Image.SCALE_DEFAULT);
        BufferedImage bufferedThumbnail = new BufferedImage(thumbnail.getWidth(null), thumbnail.getHeight(null), BufferedImage.SCALE_DEFAULT);
        bufferedThumbnail.getGraphics().drawImage(thumbnail, 0, 0, null);
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ImageIO.write(bufferedThumbnail, extension, baos);
        
        return new ByteArrayInputStream(baos.toByteArray());
    }
    
    public static String getExtension(String filename) {
        if (filename == null) {
            return null;
        }
        int extensionPos = filename.lastIndexOf(".");
        int lastUnixPos = filename.lastIndexOf("/");
        int lastWindowsPos = filename.lastIndexOf("\\");
        int lastSeparator = Math.max(lastUnixPos, lastWindowsPos);

        int index = lastSeparator > extensionPos ? -1 : extensionPos;
        if (index == -1) {
            return "";
        } else {
            return filename.substring(index + 1);
        }
    }
}

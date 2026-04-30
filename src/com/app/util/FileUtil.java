package com.app.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.UUID;
import javax.servlet.http.Part;

public class FileUtil {
    public static String saveFile(Part part, String uploadPath) {
        try {
            String fileName = part.getSubmittedFileName();
            if (fileName == null || fileName.isEmpty()) return null;
            
            String extension = "";
            int i = fileName.lastIndexOf('.');
            if (i > 0) {
                extension = fileName.substring(i);
            }
            
            String newFileName = UUID.randomUUID().toString() + extension;
            
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdirs();
            
            String filePath = uploadPath + File.separator + newFileName;
            
            try (InputStream input = part.getInputStream();
                 FileOutputStream output = new FileOutputStream(filePath)) {
                byte[] buffer = new byte[1024];
                int length;
                while ((length = input.read(buffer)) > 0) {
                    output.write(buffer, 0, length);
                }
            }
            return "uploads/" + newFileName;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}

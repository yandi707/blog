package wen.blog.util;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;

public class DownloadTest {
    public static void main(String[] args) {
        HttpURLConnection conn = null;
        InputStream inputStream = null;
        BufferedInputStream bis = null;
        FileOutputStream out = null;
        try {
            File fileDir = new File("C:\\Users\\123\\Desktop\\resume");
            if (!fileDir.isDirectory() && !fileDir.exists()) {
                fileDir.mkdirs();
            }
            out = new FileOutputStream(fileDir + "\\img.jpg");
            // 建立链接
            URL httpUrl = new URL("http://localhost:8080/static/img/about.jpg");
            conn = (HttpURLConnection) httpUrl.openConnection();
            //以Post方式提交表单，默认get方式
            conn.setRequestMethod("GET");
            conn.setDoInput(true);
            conn.setDoOutput(true);
            // post方式不能使用缓存
            conn.setUseCaches(false);
            //连接指定的资源
            conn.connect();
            //获取网络输入流
            inputStream = conn.getInputStream();
            bis = new BufferedInputStream(inputStream);
            byte b[] = new byte[1024];
            int len = 0;
            while ((len = bis.read(b)) != -1) {
                out.write(b, 0, len);
            }
            System.out.println("下载完成...");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (out != null) {
                    out.close();
                }
                if (bis != null) {
                    bis.close();
                }
                if (inputStream != null) {
                    inputStream.close();
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }

    }
}

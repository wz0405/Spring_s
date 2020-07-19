package upload.data;

import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public class SpringFileWriter {
    FileOutputStream fos;

    public void writeFile(MultipartFile file, String path, String fileName) {
        try {
            byte fileData[] = file.getBytes(); //파일을 바이트로 밖에 못읽어 온다.
            fos = new FileOutputStream(path + "//" + fileName);//경로사이에는 //필수
            fos.write(fileData);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            System.out.println("파일업로드 오류" + e.getMessage());

        } finally {
            try {
                fos.close();
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
    }
}

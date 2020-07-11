package guest.data;

import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public class SpringFileWriter {
   
   FileOutputStream fos;
   
   public void writeFile(MultipartFile file, String path, String fileName)
   {
      try {
         byte fileData[]=file.getBytes();
         fos=new FileOutputStream(path+"//"+fileName);
         fos.write(fileData);
         
      } catch (IOException e) {
         // TODO Auto-generated catch block
         System.out.println("파일업로드 오류:"+e.getMessage());
      }finally {
         try {
            fos.close();
         } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
      }
      
   }
}
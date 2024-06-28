package com.dfbz.springboot_jsp.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;

@RestController
public class FileUploadController {

    @PostMapping("/image/upload")
    public ResponseEntity<String> uploadFile(@RequestParam("image") MultipartFile image) {
        if (image.isEmpty()) {
            return new ResponseEntity<>("上传的文件为空", HttpStatus.BAD_REQUEST);
        }

        try {
            // 获取文件名
            String fileName = StringUtils.cleanPath(image.getOriginalFilename());
            // 创建文件输入流
            InputStream inputStream = image.getInputStream();

            // 创建静态文件夹路径
           File staticFolder = new File("D:\\code\\SrpingBoot\\SpringBoot_JSP\\src\\main\\webapp\\image");

           // 如果目录不存在则创建
            if (!staticFolder.exists()) {
                staticFolder.mkdirs();
            }
            // 创建文件输出流
            OutputStream outputStreamStatic = new FileOutputStream(new File(staticFolder, fileName));

            // 将输入流的数据传输到输出流
            int readBytes;
            byte[] buffer = new byte[8192];
            while ((readBytes = inputStream.read(buffer, 0, 8192)) != -1) {

                outputStreamStatic.write(buffer, 0, readBytes);
            }
            // 关闭流
            outputStreamStatic.close();

            inputStream.close();

            return new ResponseEntity<>("文件上传成功", HttpStatus.OK);
        } catch (IOException e) {
            return new ResponseEntity<>("文件上传失败", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
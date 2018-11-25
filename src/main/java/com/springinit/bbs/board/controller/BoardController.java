package com.springinit.bbs.board.controller;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.springinit.bbs.board.domain.FileVO;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springinit.bbs.board.domain.BoardVO;
import com.springinit.bbs.board.service.BoardService;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.util.Date;


@Controller
public class BoardController {

    @Resource(name="com.springinit.bbs.board.service.BoardService")
    BoardService mBoardService;

    @RequestMapping("/list")
    private String boardList(Model model) throws Exception {

        model.addAttribute("list", mBoardService.boardListService());

        return "list";
    }

    @RequestMapping("/detail/{id}")
    private String boardDetail(@PathVariable int id, Model model) throws Exception {

        model.addAttribute("detail", mBoardService.boardDetailService(id));
        model.addAttribute("files", mBoardService.fileDetailService(id));

        return "detail";
    }

    @RequestMapping("/insert")
    private String boardInsertForm() {

        return "insert";
    }

    @RequestMapping("/insertProc")
    private String boardInsertProc(HttpServletRequest request, @RequestPart MultipartFile files) throws Exception {

        BoardVO board = new BoardVO();
        FileVO file = new FileVO();

        String bbs[] = request.getParameterValues("bbsRadio");
//        System.out.println(bbs[0]);

        board.setBoardno(Integer.parseInt(bbs[0]));
        board.setSubject(request.getParameter("subject"));
        board.setContent(request.getParameter("content"));
        board.setWriter(request.getParameter("writer"));
        board.setPassword(request.getParameter("password"));

        Date now = new Date();
        board.setRegister_datetime(now);


        if(files.isEmpty()) {
            mBoardService.boardInsertService(board);
        } else {

            String sourceFileName = files.getOriginalFilename();
            String sourceFileNameExtension = FilenameUtils.getExtension(sourceFileName).toLowerCase();

            File destinationFile;
            String destinationFileName;
            String fileUri = "D:/wjd0412/0. project/98. ideaProject/2. bbs/src/main/webapp/WEB-INF/uploadFiles/";


            do {
                destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + sourceFileNameExtension;
                destinationFile = new File(fileUri + destinationFileName);
            } while (destinationFile.exists());

            destinationFile.getParentFile().mkdirs();
            files.transferTo(destinationFile);

            mBoardService.boardInsertService(board);


            file.setBno(board.getId());
            file.setFileName(destinationFileName);
            file.setFileOriName(sourceFileName);
            file.setFileUrl(fileUri);

            mBoardService.fileInsertService(file);

        }

        return "redirect:/list";
    }

    @RequestMapping("/update/{id}")
    private String boardUpdateForm(@PathVariable int id, Model model) throws Exception {

        model.addAttribute("detail", mBoardService.boardDetailService(id));

        return "update";
    }

    @RequestMapping("/updateProc")
    private String boardUpdateProc(HttpServletRequest request) throws Exception {

        BoardVO board = new BoardVO();

//        System.out.println(request.getParameter("bbsRadio"));   //null값


//        /* 게시판 선택 체크 */
//        System.out.println("///////////////////////////////////////////////////////////////");
//        String bbssel = request.getParameterValues("bbsRadio")[0];
//
//        if (bbssel == null) {
//            bbssel = "x";
//        }

//        System.out.println(bbssel);
//        //System.out.println(request.getParameterValues("bbsRadio"));   //null값//
//        System.out.println(request.getParameter("id"));
//        System.out.println(request.getParameter("subject"));
//        System.out.println(request.getParameter("bbsRadio"));   //null값
//        System.out.println(request.getParameter("password"));
//        System.out.println(request.getParameter("content"));
//        System.out.println("///////////////////////////////////////////////////////////////");


        board.setId(Integer.parseInt(request.getParameter("id")));
//        String bbs[] = request.getParameterValues("bbsRadio");
//        board.setBoardno(Integer.parseInt(bbs[0]));
        board.setBoardno(Integer.parseInt(request.getParameter("bbsRadio")));
        board.setSubject(request.getParameter("subject"));
        board.setContent(request.getParameter("content"));
        board.setPassword(request.getParameter("password"));

//        board.setBlock(Integer.parseInt(request.getParameter("block")));
//        board.setDolike(Integer.parseInt(request.getParameter("dolike")));
//        board.setFile(request.getParameter("file"));

        mBoardService.boardUpdateService(board);

        return "redirect:/detail/"+request.getParameter("id");
    }

    @RequestMapping("/delete/{id}")
    private String boardDelete(@PathVariable int id) throws Exception {

        mBoardService.boardDeleteService(id);

        return "redirect:/list";
    }

    @RequestMapping("/deleteFile/{id}")
    private String boardFileDelete(@PathVariable int id, HttpServletRequest request, HttpServletResponse response) throws Exception {

        request.setCharacterEncoding("UTF-8");
        FileVO fileVO = mBoardService.fileDetailService(id);

        try {
            String fileUrl = fileVO.getFileUrl();
            String fileName = fileVO.getFileName();
            String sFileName = fileUrl + fileName;

            File sFile = new File(sFileName);
            if (sFile.exists() && sFile.isFile()) {
                sFile.delete();
            }
        } catch (Exception e) {
            System.out.println("서버파일삭제 : " + e.getMessage());
        }


        mBoardService.boardFileDeleteService(id); //DB에서 삭제

        return "redirect:/detail/{id}";
    }

    @RequestMapping("/fileDown/{id}")
    private void fileDown(@PathVariable int id, HttpServletRequest request, HttpServletResponse response) throws Exception {

        request.setCharacterEncoding("UTF-8");
        FileVO fileVO = mBoardService.fileDetailService(id);

        try {
            String fileUrl = fileVO.getFileUrl();
            fileUrl += "/";
            String savePath = fileUrl;
            String fileName = fileVO.getFileName();

            String oriFileName = fileVO.getFileOriName();

//            InputStream in = null;
//            OutputStream os = null;
            BufferedInputStream in = null;
            BufferedOutputStream os = null;

            File file = null;
            boolean skip = false;
            String client = "";

            try {
                file = new File(savePath, fileName);
//                in = new FileInputStream(file);
                in = new BufferedInputStream(new FileInputStream(file));
            } catch (FileNotFoundException fe) {
                skip = true;
            }

            client = request.getHeader("User-Agent");

            response.reset();
            response.setContentType("application/octet-stream");
            response.setHeader("Content-Description", "JSP Generated Data");

            if (!skip) {
                if (client.indexOf("MSIE") != -1) {
                    response.setHeader("Content-Disposition", "attachment; filename=\"" +
                            java.net.URLEncoder.encode(oriFileName, "UTF-8").replaceAll("\\+","\\ ") + "\"");
                } else if (client.indexOf("Trident") != -1) {
                    response.setHeader("Content-Disposition", "attachment; filename=\"" +
                            java.net.URLEncoder.encode(oriFileName, "UTF-8").replaceAll("\\+","\\ ") + "\"");
                } else {
                    response.setHeader("Content-Disposition", "attachment; fileName=\"" +
                            new String(oriFileName.getBytes("UTF-8"), "ISO8859_1") + "\"");
                    response.setHeader("Content-Type", "application/octet-stream; charset=utf-8");
                }

                response.setHeader("Content-Length", "" + String.valueOf(file.length()));

//                os = response.getOutputStream();
                os = new BufferedOutputStream(response.getOutputStream());

                byte b[] = new byte[(int) file.length()];
                int leng = 0;

                while ((leng = in.read(b)) != -1) { // > 0
                    os.write(b, 0, leng);
                }

            } else {
                response.setContentType("text/html;charset=UTF-8");
                System.out.println("<script language='javascript'>alert('파일을 찾을 수 없습니다.');history.back();</script>");
            }
            os.flush();
            os.close();
            in.close();

        } catch (Exception e) {
            System.out.println("ERROR : " + e.getMessage());
        }
    }

}

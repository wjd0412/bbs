package com.springinit.bbs;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springinit.bbs.board.mapper.BoardMapper;

@Controller
public class jspTest {

    @Resource(name="com.springinit.bbs.board.mapper.BoardMapper")
    BoardMapper mBoardMapper;

    @RequestMapping("/test")
    private String jspTest() throws Exception {

//        System.out.println(mBoardMapper.boardCount());
        return "test";
    }
}

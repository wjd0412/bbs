package com.springinit.bbs.board.service;

import java.util.List;

import javax.annotation.Resource;

import com.springinit.bbs.board.domain.FileVO;
import org.springframework.stereotype.Service;

import com.springinit.bbs.board.domain.BoardVO;
import com.springinit.bbs.board.mapper.BoardMapper;


@Service("com.springinit.bbs.board.service.BoardService")

public class BoardService {

    @Resource(name="com.springinit.bbs.board.mapper.BoardMapper")
    BoardMapper mBoardMapper;

    public List<BoardVO> boardListService() throws Exception {

        return mBoardMapper.boardList();
    }

    public BoardVO boardDetailService(int id) throws Exception {

        return mBoardMapper.boardDetail(id);
    }

    public int boardInsertService(BoardVO board) throws Exception {

        return mBoardMapper.boardInsert(board);
    }

    public int boardUpdateService(BoardVO board) throws Exception {

        return mBoardMapper.boardUpdate(board);
    }

    public int boardDeleteService(int id) throws Exception {

        return mBoardMapper.boardDelete(id);
    }

    public int boardFileDeleteService(int id) throws Exception {

        return mBoardMapper.boardFileDelete(id);
    }

    public int fileInsertService(FileVO file) throws Exception {

        return mBoardMapper.fileInsert(file);
    }

    public FileVO fileDetailService(int bno) throws Exception {

        return mBoardMapper.fileDetail(bno);
    }


}

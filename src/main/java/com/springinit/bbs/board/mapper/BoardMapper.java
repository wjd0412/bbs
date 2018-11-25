package com.springinit.bbs.board.mapper;

import com.springinit.bbs.board.domain.BoardVO;
import com.springinit.bbs.board.domain.FileVO;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.List;

@Repository("com.springinit.bbs.board.mapper.BoardMapper")
public interface BoardMapper {

    //게시판 개수
//    public int boardCount() throws Exception;
    @Select("select count(distinct boardno) from board") int boardCount() throws Exception;

    //게시글 목록
    @Select("select * from board")
    List<BoardVO> boardList() throws Exception;

    @Update("update files set boardHit = boardHit + 1 where bno = #{bno}")
    int updateBoradHit(int bno) throws Exception;

    //게시글 상세
    @Select("select * from board where id = #{id}")
    BoardVO boardDetail(int id) throws Exception;

    //게시글 작성
    @Insert("insert into board ( boardno, subject, content, writer, password, register_datetime ) " +
                    "values ( #{boardno}, #{subject}, #{content}, #{writer}, #{password}, #{register_datetime} )")
    @Options(useGeneratedKeys = true, keyProperty = "id")
    int boardInsert(BoardVO board) throws Exception;

    //첨부파일 등록
    @Insert("insert into files ( fno, bno, fileName, fileOriName, fileUrl ) " +
            "values ( #{fno}, #{bno}, #{fileName}, #{fileOriName}, #{fileUrl} )")
    int fileInsert(FileVO file) throws Exception;

    //첨부파일 상세
    @Select("select * from files where bno = #{bno}")
    FileVO fileDetail(int bno) throws Exception;

    //첨부파일 삭제
    @Delete("delete from files where bno = #{bno}")
    int boardFileDelete(int bno) throws Exception;

    //게시글 수정
    @Update("update board " +
            "set boardno = #{boardno}, subject = #{subject}, content = #{content}, password = #{password}" +
//            ", block = #{block}, dolike = #{dolike}, file = #{file} " +
            "where id = #{id}"
    )
    int boardUpdate(BoardVO board) throws Exception;

    //게시글 삭제
    @Delete("delete from board where id = #{id}")
    int boardDelete(int id) throws Exception;

//    @Delete("<script>" +
//            "DELETE FROM diagnosis_counselor " +
//            "WHERE diagnosis_id in " +
//            "<foreach collection=\"diagnosisIds\" item=\"diagnosisId\" separator=\",\"  open=\"( \" close=\") \">" +
//            " #{diagnosisId} " +
//            "</foreach>" +
//            "</script>")
//    void deleteDiagnosisCounselor(@Param("diagnosisIds") int [] diagnosisIds) throws Exception;


}

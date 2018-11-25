package com.springinit.bbs.board.domain;

import java.util.Date;

public class BoardVO {
    private int id;
    private int boardno;
    private String subject;
    private String content;
    private String writer;
    private String password;
    private Date register_datetime;
    private Date update_datetime;
    private int block;
    private int dolike;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getBoardno() {
        return boardno;
    }

    public void setBoardno(int boardno) {
        this.boardno = boardno;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getRegister_datetime() {
        return register_datetime;
    }

    public void setRegister_datetime(Date register_datetime) {
        this.register_datetime = register_datetime;
    }

    public Date getUpdate_datetime() {
        return update_datetime;
    }

    public void setUpdate_datetime(Date update_datetime) {
        this.update_datetime = update_datetime;
    }

    public int getBlock() {
        return block;
    }

    public void setBlock(int block) {
        this.block = block;
    }

    public int getDolike() {
        return dolike;
    }

    public void setDolike(int dolike) {
        this.dolike = dolike;
    }

}

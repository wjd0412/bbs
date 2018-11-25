<%--
  Created by IntelliJ IDEA.
  User: Muz
  Date: 2018-11-21
  Time: 오후 4:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>게시판 내용보기</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>
<body>
    <h2> 게시글 내용보기 </h2>

    <button class="btn btn-primary" onclick="location.href='/update/${detail.id}'">수정</button>
    <button class="btn btn-danger" onclick="listDelete();">삭제</button>
    <%--<button class="btn btn-danger" onclick="location.href='/delete/${detail.id}'">삭제</button>--%>

    <div class="container">
        <form action="/insert" method="post">
            <div class="form-group">
                <label>제목</label>
                <p>${detail.subject}</p>
            </div>
            <div class="form-group">
                <label>작성자</label>
                <p>${detail.writer}</p>
            </div>
            <div class="form-group">
                <label>작성날짜</label>
                <p><fmt:formatDate value="${detail.register_datetime}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
            </div>
            <div class="form-group">
                <label>게시판</label>
                <p>${detail.boardno}</p>
            </div>
            <div class="form-group">
                <label>내용</label>
                <p>${detail.content}</p>
            </div>
            <div class="form-group">
                <label>첨부파일</label>
                <p>
                    <a href="/fileDown/${files.bno}">${files.fileOriName}</a>
                    <c:if test="${not empty files.fileOriName}"><a href="javascript:void(0);" onclick="filedel();">삭제</a></c:if>
                </p>
            </div>
            <button type="submit" class="btn btn-primary">작성</button>
        </form>
    </div>

    <script>
        // $('document').ready(function () {
        //
        //     $('#filedel').on('click', function (e) {
        //         e.preventDefault();
        //         if (confirm("첨부파일을 삭제하겠습니까?")) {
        //             alert("삭제됨");
        //         }
        //     })
        //
        // });

        function listDelete() {
            if (confirm('해당 글을 삭제하겠습니까?')) {
                location.href = "/delete/${detail.id}"
                alert('정상적으로 삭제되었습니다.');
            }
        }

        function filedel() {
            if (confirm("첨부파일을 삭제하겠습니까?")) {
                location.href = "/deleteFile/${detail.id}"
            }
        }
    </script>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>

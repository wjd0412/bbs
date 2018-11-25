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
    <title>게시판 글삭제</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>
<body>

    <h2> 게시글 삭제 </h2>

    <div class="container">
        <form action="/updateProc" method="post">
            <div class="form-group">
                <label for="subject">제목</label>
                <input type="text" class="form-control" id="subject" name="subject" value="${detail.subject}">
            </div>
            <div class="form-group">
                <label for="content">내용</label>
                <textarea class="form-control" id="content" name="content" rows="3">${detail.content}</textarea>
            </div>
            <input type="hidden" name="id" value="${id}"/>
            <button type="submit" class="btn btn-primary">수정</button>
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>

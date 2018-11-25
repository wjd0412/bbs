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
    <title>게시판 List</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>
<body>
    <h2> 게시글 목록 </h2>

    <button class="btn btn-primary" onclick="location.href='/insert'">글쓰기</button>

    <div class="container">
        <table class="table table-hover">
            <tr>
                <th>No</th>
                <th>BBS</th>
                <th>제목</th>
                <th>작성자</th>
                <th>등록날짜</th>
                <th>조회수0</th>
            </tr>
            <c:forEach var="l" items="${list}">
                <tr onclick="location.href='/detail/${l.id}'">
                    <td>${l.id}</td>
                    <td>${l.boardno}</td>
                    <td>${l.subject}</td>
                    <td>${l.writer}</td>
                    <td><fmt:formatDate value="${l.register_datetime}" pattern="yyyy-MM-dd HH:mm:ss" /></td></td>
                    <td>
                        <c:choose>
                            <c:when test="${l.boardHit == '' || l.boardHit eq null}">0</c:when>
                            <c:when test="${l.boardHit != '' || l.boardHit ne null}">${l.boardHit}</c:when>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>

        </table>
    </div>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>

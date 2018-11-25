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
    <title>게시판 글수정</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>
<body>

    <h2> 게시글 수정 </h2>

    <div class="container">
        <form action="/updateProc" method="post">
            <div class="form-group">
                <label for="subject">제목</label>
                <input type="text" class="form-control" id="subject" name="subject" value="${detail.subject}">
            </div>

            <div class="form-group">
                <p>게시판 선택${detail.boardno}</p>
                <div class="btn-group btn-group-toggle" data-toggle="buttons">
                    <label class="btn btn-primary"><%--<label class="btn btn-primary${detail.boardno == 1 ? ' focus active' : ''}">--%>
                        <input type="radio" name="bbsRadio" id="bbsidx_1" value="1" ${detail.boardno eq 1 ? 'checked' : ''}> 가능여부
                    </label>
                    <label class="btn btn-warning">
                        <input type="radio" name="bbsRadio" id="bbsidx_2" value="2" ${detail.boardno eq 2 ? 'checked' : ''}> 불안해요
                    </label>
                    <label class="btn btn-success">
                        <input type="radio" name="bbsRadio" id="bbsidx_3" value="3" ${detail.boardno eq 3 ? 'checked' : ''}> 존버방
                    </label>
                    <label class="btn btn-info">
                        <input type="radio" name="bbsRadio" id="bbsidx_4" value="4" ${detail.boardno eq 4 ? 'checked' : ''}> 내옷봐줘
                    </label>
                    <label class="btn btn-danger">
                        <input type="radio" name="bbsRadio" id="bbsidx_5" value="5" ${detail.boardno eq 5 ? 'checked' : ''}> 썸남썸녀
                    </label>
                </div>
            </div>

            <div class="form-group">
                <label for="password">암호</label>
                <input type="text" class="form-control" id="password" name="password" value="${detail.password}">
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
    <script>
        $('document').ready(function () {

            //사용중인 게시판idx 표시하기
            $('input[name="bbsRadio"][value=${detail.boardno}]').parent().addClass('focus active');

            // //form action전에 게시판 선택여부 체크
            // $('form').on('submit', function (event) {
            //
            //     var bbschk = $('label.btn.active').children("input").val();
            //     // console.log(bbschk);
            //     // return false;
            //
            //     if (typeof bbschk == "undefined" ) {
            //         alert('게시판을 선택해 주세요!~');
            //         event.preventDefault();
            //         return false;
            //     }
            // });

        });

        <%--var bno = '<c:out value="${detail.boardno}"/>';--%>
        <%--console.log(bno);--%>
    </script>
</body>
</html>

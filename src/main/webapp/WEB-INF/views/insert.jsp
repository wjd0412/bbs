<%--
  Created by IntelliJ IDEA.
  User: Muz
  Date: 2018-11-21
  Time: 오후 4:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>게시판 글등록</title>

    <%--<link rel="stylesheet" href="/resource/css/bootstrap.min.css">--%>
    <%--<link rel="stylesheet" href="/resource/css/bootstrap-theme.min.css">--%>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

    <style>
        p { margin-bottom:10px; }
    </style>

</head>
<body>

    <h2> 게시글 작성 </h2>

    <div class="container">
        <form action="/insertProc" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="subject">제목</label>
                <input type="text" class="form-control" id="subject" name="subject" placeholder="제목을 입력하세요.">
            </div>
            <div class="form-group">
                <p>게시판 선택</p>
                <div class="btn-group btn-group-toggle" data-toggle="buttons">
                    <label class="btn btn-primary">
                        <input type="radio" name="bbsRadio" id="jb-radio-1" value="1"> 가능여부
                    </label>
                    <label class="btn btn-warning">
                        <input type="radio" name="bbsRadio" id="jb-radio-2" value="2"> 불안해요
                    </label>
                    <label class="btn btn-success">
                        <input type="radio" name="bbsRadio" id="jb-radio-3" value="3"> 존버방
                    </label>
                    <label class="btn btn-info">
                        <input type="radio" name="bbsRadio" id="jb-radio-4" value="4"> 내옷봐줘
                    </label>
                    <label class="btn btn-danger">
                        <input type="radio" name="bbsRadio" id="jb-radio-5" value="5"> 썸남썸녀
                    </label>
                </div>
            </div>
            <div class="form-group">
                <label for="writer">작성자</label>
                <input type="text" class="form-control" id="writer" name="writer" placeholder="자동으로 입력될 예정입니다.">
            </div>
            <div class="form-group">
                <label for="password">암호</label>
                <input type="text" class="form-control" id="password" name="password" placeholder="암호를 입력하세요.">
            </div>
            <div class="form-group">
                <label for="content">내용</label>
                <textarea class="form-control" id="content" name="content" rows="3"></textarea>
            </div>

            <input type="file" name="files">

            <button type="submit" class="btn btn-primary">글등록</button>
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <script>
        $('document').ready(function () {

            //form action전에 게시판 선택여부 체크
            $('form').on('submit', function (event) {

                var bbschk = $('label.btn.active').children("input").val();
                // console.log(bbschk);
                // return false;

                if (typeof bbschk == "undefined" ) {
                    alert('게시판을 선택해 주세요!~');
                    event.preventDefault();
                    return false;
                }
            });

        });

    </script>

</body>
</html>

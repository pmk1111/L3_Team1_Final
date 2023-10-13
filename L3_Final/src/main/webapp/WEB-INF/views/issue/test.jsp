<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="container">
<form action="../issue/upload"  method="post"  enctype="multipart/form-data" name="boardform">
    
    <div class="form-group">
     <label for="board_file">파일 첨부</label>   
      <input type="file" id="upfile" name="uploadfiles" multiple>
    </div>
    <div class="form-group">   
     <button type=submit class="btn btn-primary">등록</button>
     <button type=reset  class="btn btn-danger">취소</button>
   </div>
  </form>
  </div>
</body>
</html>
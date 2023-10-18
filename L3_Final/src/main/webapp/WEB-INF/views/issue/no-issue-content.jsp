<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
if (${showAlert}==true) {
    alert('존재하지 않는 게시글입니다.');
    window.location.href = '../issue/issue-list';
}
</script>
</body>
</html>
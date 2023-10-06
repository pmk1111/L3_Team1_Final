<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en"class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default"
      data-assets-path="../resources/mainboard/assets/" data-template="vertical-menu-template-free">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" 
    	  content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>

    <title>WidUs - 대시보드</title>
    <meta name="description" content="" />

<!-- Favicon -->
<link rel="icon" type="image/x-icon" href="../resources/mainboard/assets/img/favicon/favicon.ico" />

<!-- Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet" />

<!-- Icons -->
<link rel="stylesheet" href="../resources/mainboard/assets/vendor/fonts/boxicons.css" />

<!-- Core CSS -->
<link rel="stylesheet" href="../resources/mainboard/assets/vendor/css/core.css" class="template-customizer-core-css" />
<link rel="stylesheet" href="../resources/mainboard/assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
<link rel="stylesheet" href="../resources/mainboard/assets/css/demo.css" />

<!-- Vendors CSS -->
<link rel="stylesheet" href="../resources/mainboard/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />
<link rel="stylesheet" href="../resources/mainboard/assets/vendor/libs/apex-charts/apex-charts.css" />

<!-- Helpers -->
<script src="../resources/mainboard/assets/vendor/js/helpers.js"></script>

<!-- Template customizer & Theme config files -->
<script src="../resources/mainboard/assets/js/config.js"></script>

<!-- Google Fonts (Optional) -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">

<!-- Bootstrap CSS (Optional) -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

<!-- Bootstrap JavaScript (Optional) -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<!-- Chart.js (Optional) -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<!-- ECharts (Optional) -->
<script src="https://cdn.jsdelivr.net/npm/echarts@latest/dist/echarts.min.js"></script>

<!-- Google Analytics (Optional) -->
<script async src="https://www.google-analytics.com/analytics.js"></script>

   


    <style>
      .leftbar-close{background-color: #9F7AB0; border-radius: 50%;}
      .welcome-message{width:100%;}
      .my-schedule{width:66%; margin-right:6.6px;}
      .memo, .my-work{min-height: 315px; }
      
      .card{
    background-clip: padding-box;
    	 height: 85vh; /* 화면 높이에 85% 맞춤 */
    	
      }
  
/*   .card2 {
    position: relative;
    display: flex;
    flex-direction: column;
    min-width: 0;
} */
/*  .card_contents{
     
     margin-top:10px; 
     margin-left:20px;
 }
  */
 	.card-body { padding:50px;}


.nav-tabs {
    border-bottom: 1px solid lightgray;
}


 body {
    color: #566787;
    background: #f5f5f5;
    font-family: 'Roboto', sans-serif;
}
.table-responsive {
    margin: 30px 0;
}
.table-wrapper {
    min-width: 1000px;
    background: #fff;
    padding: 20px;
    box-shadow: 0 1px 1px rgba(0,0,0,.05);
}
.table-title {
    font-size: 15px;
    padding-bottom: 10px;
    margin: 0 0 10px;
    min-height: 45px;
}
.table-title h2 {
    margin: 5px 0 0;
    font-size: 24px;
}
.table-title select {
    border-color: #ddd;
    border-width: 0 0 1px 0;
    padding: 3px 10px 3px 5px;
    margin: 0 5px;
}
.table-title .show-entries {
    margin-top: 7px;
}

table.table tr th, table.table tr td {
    border-color: #e9e9e9;
}
table.table th i {
    font-size: 13px;
    margin: 0 5px;
    cursor: pointer;
}
table.table td:last-child {
    width: 130px;
}
table.table td a {
    color: #a0a5b1;
    display: inline-block;
    margin: 0 5px;
}
table.table td a.view {
    color: #03A9F4;
}
table.table td a.edit {
    color: #FFC107;
}
table.table td a.delete {
    color: #E34724;
}
table.table td i {
    font-size: 19px;
}    
select {

width: 80px;

padding: .15em .8em;

border: 1px solid lightgray;
border-radius: 10px;
font-family: inherit;

background: url('../admin/img/arrow.jpg') no-repeat 95% 50%;

display: inline;

-webkit-appearance: none;

-moz-appearance: none;

appearance: none;

background-color:white;

}

select::-ms-expand {

display: none;

}
.search{
 display:flex;

}
.search-content {

  position: relative;
  width: 200px;
}

.search-bar {
  width: 100%;
  border: 1px solid #bbb;
  border-radius: 8px;
  padding: 10px 12px;
  font-size: 14px;
}

.search-img {
  position : absolute;
  width: 17px;
  top: 10px;
  right: 12px;
  margin: 0;
}

 .month-select{
   margin-left:auto;
   width:130px;
}
.exel{
 padding:auto;
  margin-top:10px;
  margin-left:730px;


}


    </style>
  </head>

  <body>
      <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
        <!-- Menu -->

  		<jsp:include page="../mainboard/Admin_leftbar.jsp"></jsp:include>
        <!-- / Menu -->

        <!-- Layout container -->
        <div class="layout-page">
          <!-- Navbar -->


				<!-- / Navbar -->
				<div class="content-wrapper">
					<!-- Content -->
<div class="container-xxl flex-grow-1 container-p-y">
    <div class="row">
        <div class="col-lg-12 mb-4 order-0 welcome-message">

            <div class="container-fluid">
                <div class="card">
                    <div class="card-body">
                        <h2 class="card-title text-primary">접속 통계</h2>
                        <hr>
                        <p class="mb-4">월별 통계 차트 | 최근 6개월</p>

                        <!-- 탭 메뉴 -->
                        <ul class="nav nav-tabs">
                            <li class="nav-item"><a class="nav-link active" aria-current="page" href="#">월별</a></li>
                            <li class="nav-item"><a class="nav-link" href="#">주별</a></li>
                            <li class="nav-item"><a class="nav-link" href="#">일별</a></li>
                        </ul>
                        <!-- 차트 -->
                        <canvas id="lineChart" width="200px" height="50px" style="margin:auto; padding: 5px 20px 20px 20px; display: block; box-sizing: border-box;"></canvas>
                        <!-- 검색 기능 및 테이블 -->
                        <div class="searchAndtable">
                    <div class="search">
                        <select>
                            <option>이름</option>
                            <option>아이디</option>
                            <option>번호</option>
                        </select>
                        <div class="search-content">
                            <input class="search-bar" type="text" placeholder="검색어 입력">
                            <img class="search-img" src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
                        </div>
                        <a class="exel" href="#">엑셀 다운로드</a>
                        <select class="month-select">
                            <option>2023년7월</option>
                            <option>2023년8월</option>
                            <option>2023년9월</option>
                        </select>
                    </div>
                    <!-- 테이블 -->
                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>회사</th>
                                    <th>이름 <i class="fa fa-sort"></i></th>
                                    <th>부서</th>
                                    <th>직책 <i class="fa fa-sort"></i></th>
                                    <th>계정</th>
                                    <th>총 접속수 <i class="fa fa-sort"></i></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>jj</td>
                                    <td>김혜원</td>
                                    <td></td>
                                    <td></td>
                                    <td>naver@naver.com</td>
                                    <td>7</td>
                                </tr>
                                <tr>
                                    <td>jj</td>
                                    <td>김혜원</td>
                                    <td></td>
                                    <td></td>
                                    <td>naver@naver.com</td>
                                    <td>7</td>
                                </tr>
                                <tr>
                                    <td>jj</td>
                                    <td>김혜원</td>
                                    <td></td>
                                    <td></td>
                                    <td>naver@naver.com</td>
                                    <td>7</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    </div>
                    </div>
                    <script>
                        const data = {
                            labels: ['2023 4월', '2023 5월', '2023 6월', '2023 7월', '2023 8월', '2023 9월'],
                            datasets: [
                                {
                                    label: 'Dataset',
                                    data: [50, 20, 10, 40, 25, 60], // 원하는 데이터 값을 넣으세요.
                                    borderColor: 'lightblue',
                                    backgroundColor: 'lightblue',
                                    pointRadius: 10,
                                    pointHoverRadius: 15
                                }
                            ]
                        };

                        const config2 = {
                            type: 'line',
                            data: data,
                            options: {
                                responsive: true,
                                plugins: {
                                    title: {
                                        display: true,
                                    }
                                }
                            }
                        };

                        // Chart 생성
                        const ctx = document.getElementById('lineChart').getContext('2d');
                        new Chart(ctx, config2);
                    </script>
                
                </div>
            </div>
        </div>
    </div>
</div>










				<!-- Footer -->
						<footer class="content-footer footer bg-footer-theme">
							<div
								class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
								<div class="mb-2 mb-md-0">
									©
									<script>
										document
												.write(new Date().getFullYear());
									</script>
									(주)WidUs
								</div>
								<div>
									<a href="https://themeselection.com/license/"
										class="footer-link me-4" target="_blank">License</a> <a
										href="https://themeselection.com/" target="_blank"
										class="footer-link me-4">More Themes</a> <a
										href="https://themeselection.com/demo/sneat-bootstrap-html-admin-template/documentation/"
										target="_blank" class="footer-link me-4">Documentation</a>

									<a
										href="https://github.com/themeselection/sneat-html-admin-template-free/issues"
										target="_blank" class="footer-link me-4">Support</a>
								</div>
							</div>

						</footer>

						<!-- Footer -->

						<div class="content-backdrop fade"></div>
					</div>
					<!-- Content wrapper -->
        </div>
        <!-- / Layout page -->
      </div>

      <!-- Overlay -->
      <div class="layout-overlay layout-menu-toggle"></div>
    </div>
    <!-- / Layout wrapper -->

    <!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->
    <script src="../resources/mainboard/assets/vendor/libs/jquery/jquery.js"></script>
    <script src="../resources/mainboard/assets/vendor/libs/popper/popper.js"></script>
    <script src="../resources/mainboard/assets/vendor/js/bootstrap.js"></script>
    <script src="../resources/mainboard/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

    <script src="../resources/mainboard/assets/vendor/js/menu.js"></script>
    <!-- endbuild -->

    <!-- Vendors JS -->
    <script src="../resources/mainboard/assets/vendor/libs/apex-charts/apexcharts.js"></script>

    <!-- Main JS -->
    <script src="../resources/mainboard/assets/js/main.js"></script>

    <!-- Page JS -->
    <script src="../resources/mainboard/assets/js/dashboards-analytics.js"></script>

    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>
  </body>
</html>
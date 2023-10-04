$(document).ready(function () {

    //mydashboard calendar
    function prevMonth(date) {
        var target = new Date(date);
        target.setDate(1);
        target.setMonth(target.getMonth() - 1);
    
        return getYmd(target);
    }
    
    function nextMonth(date) {
        var target = new Date(date);
        target.setDate(1);
        target.setMonth(target.getMonth() + 1);
    
        return getYmd(target);
    }
    
    function getYmd(target) {
        // IE에서 날짜 문자열에 0이 없으면 인식 못함
        var month = ('0' + (target.getMonth() + 1)).slice(-2);
        return [target.getFullYear(), month, '01'].join('-');
    }
    
    function fullDays(date) {
        var target = new Date(date);
        var year = target.getFullYear();
        var month = target.getMonth();
    
        var firstWeekDay = new Date(year, month, 1).getDay();
        var thisDays = new Date(year, month + 1, 0).getDate();
    
        // 월 표시 달력이 가지는 셀 갯수는 3가지 가운데 하나이다.
        // var cell = [28, 35, 42].filter(n => n >= (firstWeekDay + thisDays)).shift();
        var cell = [28, 35, 42].filter(function (n) {
                return n >= (firstWeekDay + thisDays);
            }).shift();
    
        // 셀 초기화, IE에서 Array.fill()을 지원하지 않아서 변경
        // var days = new Array(cell).fill({date: '', dayNum: '', today: false});
        var days = []
        for (var i = 0; i < cell; i++) {
            days[i] = {
                date: '',
                dayNum: '',
                today: false
            };
        }
        
        var now = new Date();
        var today = new Date(now.getFullYear(), now.getMonth(), now.getDate());
        var inDate;
        for (var index = firstWeekDay, i = 1; i <= thisDays; index++, i++) {
            inDate = new Date(year, month, i);
            days[index] = {
                date: i,
                dayNum: inDate.getDay(),
                today: (inDate.getTime() === today.getTime())
            };
        }
    
        return days;
    }
    
    function drawMonth(date) {
        $('#month-this').text(date.substring(0, 7).replace('-', '.'));
        $('#month-prev').data('ym', prevMonth(date));
        $('#month-next').data('ym', nextMonth(date));
    
        $('#tbl-month').empty();
    
        var td = '<td class="__REST__ __TODAY__"><a __HREF__><span>__DATE__<span></a></td>';
        var href = '/depart/schedule?date=' + date.substring(0, 8);
        var hasEvent;
        var tdClass;
        var week = null;
        var days = fullDays(date);
        for (var i = 0, length = days.length; i < length; i += 7) {
            // 전체 셀을 주단위로 잘라서 사용
            week = days.slice(i, i + 7);
            
            var $tr = $('<tr></tr>');
            week.forEach(function (obj, index) {
         
                tdClass = (index === 0)? 'sun': '';
                tdClass = (index === 6)? 'sat': tdClass;
    
                $tr.append(td.replace('__REST__', tdClass)
                            .replace('__TODAY__', (obj['today'])? 'today': '')
                            .replace('__HREF__', (hasEvent)? 'href="'+ href + ('0' + obj['date']).slice(-2) +'"': '')
                            .replace('__DATE__', obj['date']));
            });
            $('#tbl-month').append($tr);
        }
    }
    
    $(function () {
        var date = (new Date()).toISOString().substring(0, 10);
        drawMonth(date);
    
        $('.month-move').on('click', function (e) {
            e.preventDefault();
    
            drawMonth($(this).data('ym'));
        });
    });
    
    $(function () {
    
        // 클릭 이벤트 핸들러 추가
        $('#tbl-month').on('click', 'td a', function (e) {
            e.preventDefault();
    
            // 모든 td 요소에서 on 클래스 제거
            $('#tbl-month td a').removeClass('on');
    
            // 클릭한 <a> 태그의 부모 <td> 요소에 on 클래스 추가
            $(this).addClass('on');
        });
        
    // //나중에 캘린더 db 불러올 때 사용할 ajax
        //    $.ajax({
        //        type: 'POST', // 또는 'GET' 등 HTTP 메서드 선택
        //        url: '/your-server-endpoint', // 서버 엔드포인트 URL 설정
        //        data: JSON.stringify(selectedData), // 선택된 데이터를 JSON 형식으로 전달
        //        contentType: 'application/json', // 데이터 타입 설정
        //        success: function (response) {
        //         //서버로부터 응답을 받았을 때 실행할 코드
        //            console.log('서버 응답:', response);
        //         //응답을 처리하거나 화면에 표시하는 추가 코드를 여기에 추가할 수 있습니다.
        //        },
        //        error: function (error) {
        //            // 오류 발생 시 실행할 코드
        //            console.error('오류:', error);
        //        }
        //    });
    });
    

    
    
    
    
    
        const memoContent = $('#memo-content');
        const csrfToken = 'csrf토큰 값'; // CSRF 토큰 설정
        const memoTxt = memoContent.text();
    
        if (memoTxt.trim() === "") {
            memoContent.text("내용을 입력하세요.").css('color', 'lightgrey');
        }
    
        // memo load
        $.ajax({
            url: '/memo',
            type: 'GET',
            headers: {
                'X-CSRF-TOKEN': csrfToken,
            },
            success: function (data) {
                if (data.trim() === "") {
                    // DB에서 가져온 데이터가 비어 있을 경우
                    memoContent.text("내용을 입력하세요.").css('color', 'lightgrey');
                } else {
                    // DB에서 가져온 데이터가 있을 경우
                    memoContent.text(data).css('color', 'black');
                }
            },
            error: function (error) {
                console.error('메모장 불러오기 실패:', error);
            }
        });
        
        
    
        // memo save on click
        memoContent.click(function () {
            if (memoContent.text().trim() === "내용을 입력하세요.") {
                // "내용을 입력하세요" 텍스트가 있을 경우 클릭 시 초기화
                memoContent.text("").css('color', 'black');
            }
        });
    
        // memo save on blur
        memoContent.blur(function () {
            const memoText = memoContent.text();
            if (memoText.trim() === "") {
                memoContent.text("내용을 입력하세요.").css('color', 'lightgrey');
            }
            $.ajax({
                url: '/memo',
                type: 'POST',
                contentType: 'application/json',
                headers: {
                    'X-CSRF-TOKEN': csrfToken,
                },
                data: JSON.stringify({ content: memoText }),
                success: function (data) {
                    console.log('메모 저장 성공');
                },
                error: function (error) {
                    console.error('메모 저장 실패:', error);
                }
            });
        });
    
    
    
        //work-summary load
        const counterElement = $("#counter");
        const targetNumber = 1199;
        let duration;
    
        if (targetNumber < 100) {
            duration = 1000;
        } else if (targetNumber >= 100) {
            duration = 1500;
        }
    
        let currentNumber = 0;
        let startTime = null;
    
        function updateCounter(timestamp) {
            if (!startTime) {
                startTime = timestamp;
            }
    
            const progress = timestamp - startTime;
            const speedFactor = 1 - Math.exp(-progress / duration * 5); // 속도를 조절
    
            currentNumber = Math.round(targetNumber * speedFactor);
            counterElement.text(currentNumber);
    
            if (currentNumber < targetNumber) {
                requestAnimationFrame(updateCounter);
            }
        }
    
        requestAnimationFrame(updateCounter);
    
    
        function animatePercentage() {
            const totalWorkCount = parseInt($(".total-work span").text());
    
            $(".situation-list").not(".total-work").each(function () {
                const workCount = parseInt($(this).find("span").text());
                const percent = Math.round((workCount / totalWorkCount * 100));
    
                $(this).find(".js-chart-percent").prop('Counter', 0).animate({
                    Counter: percent
                }, {
                    duration: 1000,
                    easing: 'swing',
                    step: function (now) {
                        $(this).text(Math.ceil(now) + "%");
                    }
                });
            });
        }
    
        animatePercentage();
    
    
    
        //my-work-list
        // 초기에 첫 번째 항목을 활성화한다
        $(".work-type li:first-child").addClass("active");
    
        // 항목을 클릭할 때 이벤트를 처리합니다.
        $(".work-type li").click(function () {
            // 모든 항목에서 'active' 클래스를 제거한다
            $(".work-type li").removeClass("active");
    
            // 클릭한 항목에 'active' 클래스를 추가한다
            $(this).addClass("active");
    
            // 클릭한 항목에 해당하는 work-type을 가져온다
            var selectedWorkType = $(this).text().trim();
    
            // 서버로부터 업무 데이터를 가져옵니다.
            $.ajax({
                url: "/api/posts?workType=" + selectedWorkType,
                type: "GET",
                success: function (data) {
                    // 서버에서 받은 데이터를 화면에 표시
                    if (data.length > 0) {
                        displayPosts(data);
                    } else {
                        // 데이터가 없을 때 메시지를 표시
                        displayNoDataMessage();
                    }
                },
                error: function () {
                    console.log("데이터를 불러오는 중에 오류가 발생했습니다.");
                }
            });
        });
    
        function displayPosts(posts) {
            // 게시글을 화면에 표시하는 로직을 작성
        }
    
        function displayNoDataMessage() {
            // "지연된 업무가 없습니다." 메시지를 표시하는 로직을 작성
            $(".widget-null-wrap").show();
        }
    
    }); //ready end
    
    
    

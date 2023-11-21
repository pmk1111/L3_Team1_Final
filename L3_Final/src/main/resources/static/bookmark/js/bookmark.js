$(document).ready(function () {
    
    
    //북마크 애니메이션 
    var img = $(".bookmark-icon");
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");

    img.click(function () { //마우스 클릭시 

        $this = $(this);
    
        const href = $(this).siblings('.contentTitle').find('a').attr("href");
        console.log("선택한 이슈 url = " + href);
        
        const LastEqIdx = href.lastIndexOf("=");
        const issueId = href.substring(LastEqIdx+1,);
        
        console.log("추출한 이슈 번호 = " + issueId);

        $.ajax({
            url: '../bookmark/bookmark',
            data: {
                issueId: issueId
            },
            beforeSend: function (xhr) {
                xhr.setRequestHeader(header, token);
            },
            async: false,
            type: "POST",
            success: function (result) {
                if (result === 1) {
                    console.log("성공인가요?")
                    $this.attr('src', '../resources/bookmark/img/bookmark_purple.png');
                } else {
                    console.log("지워졌나요?")
                    $this.attr('src', '../resources/bookmark/img/bookmark.png');
                }

            }//success end
        }); //ajax end
    });
    
    $(document).ready(function() {
        $('.search-label').click(function() {
            filterResults();
        });

        $('.bookmark-search').on('input', function() {
            filterResults();
        });

        function filterResults() {
            var searchTerm = $('.bookmark-search').val().toLowerCase();
            var visibleItemCounter = 0; // 표시된 항목의 갯수를 추적하는 변수

            $('.contentTitle a').each(function() {
                var resultText = $(this).text().toLowerCase();
                var $parent = $(this).closest('.bookmark-list');
                $('.all-bookmark-count').empty();
                if (resultText.includes(searchTerm)) {
                    $parent.show();
                    visibleItemCounter++; // 표시된 항목의 갯수 증가
                } else {
                    $parent.hide();
                }
                $('.all-bookmark-count').text(visibleItemCounter);
            });

            // 표시된 항목의 갯수를 출력 또는 다른 용도로 사용
            console.log("표시된 항목의 갯수: " + visibleItemCounter);
        }
    });

    });

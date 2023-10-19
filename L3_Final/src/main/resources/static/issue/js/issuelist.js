$(document).ready(function () {
    var csrfToken = $("meta[name='_csrf']").attr("content");

    $(".issue-filter").click(function () {
        if ($(".filter-dropdown").css("display") === "none") {
            $(".filter-dropdown").css('display', 'block').fadeIn(300);
        } else {
            $(".filter-dropdown").css('display', 'none').fadeOut(300);
        }
    });

    $(".custom-selected").click(function () {
        $(this).siblings(".custom-options").fadeToggle(300);
    });

    $(".custom-option").click(function () {
        var value = $(this).attr("data-value");
        var text = $(this).text();
        $(this).closest(".custom-select").find(".custom-selected").text(text);
        $(this).closest(".custom-select").find("select").val(value);
        $(this).closest(".custom-options").hide();
    });

    $(".search-label").hover(function () {
        $(".search-btn-icon").css('opacity', '0.7').css('transition', '.3s');
    }); //search-label hover end

    $(".search-label").mouseleave(function () {
        $(".search-btn-icon").css('opacity', '0.4').css('transition', '.3s');
    }); //.mouseleave end

    // 필터링 ajax 호출 함수
    $(".custom-option").on("click", function () {
        const issueStatus = $("#issueStatus").text();
        const issuePriority = $("#issuePriority").text();

        console.log(issueStatus);
        console.log(issuePriority);

        const data = {
            issueStatus: issueStatus,
            issuePriority: issuePriority,
            state: "ajax"
        };
        console.log("값 변경 됨");
        getFilteredData(data);
    });

    // 필터 초기화 후 ajax 호출 함수
    $(".clear-filter").on("click", function () {
        $("#issueStatus").text("-");
        $("#issuePriority").text("-");

        issueStatus = $("#issueStatus").text();
        issuePriority = $("#issuePriority").text();

        console.log(issueStatus);
        console.log(issuePriority);

        const data = {
            issueStatus: issueStatus,
            issuePriority: issuePriority,
            state: "ajax"
        };
        console.log("필터 초기화");
        getFilteredData(data);
    });


});

//필터링 ajax
function getFilteredData(data) {
    console.log("Ajax 요청 issueStatus: " + data.issueStatus + ", issuePriority: " + data.issuePriority);

    $.ajax({
        type: "GET",
        url: "getFilteredIssue",
        data: data,
//        beforeSend: function (xhr) {
//            xhr.setRequestHeader('X-CSRF-TOKEN', csrfToken);
//        },
        success: function (data) {
            $(".all-issue-list").empty();
            $('.all-issue-count').empty();
            if (data.length === 0) {
                var str = "<h1>데이터가 없습니다.</h1>"
                $(".all-issue-list").append(str);
            } else {
                data.forEach(function (item) {
                    var str = '<li class="list">';
                    str += '<div class="issuetype-wrap">';

                    if (item.type === '버그') {
                        str += '<img src="../resources/issue/img/bug.svg" class="issuetype-icon">';
                    } else if (item.type === '작업') {
                        str += '<img src="../resources/issue/img/task.svg" class="issuetype-icon">';
                    } else if (item.type === '에픽') {
                        str += '<img src="../resources/issue/img/epic.svg" class="issuetype-icon">';
                    }

                    str += '<span class="issuetype" style="margin-left:20px !important">' + item.type + '</span>';
                    str += '<a href="issue-detail?num=' + item.id + '">';
                    str += '<span class="issue-title" style="margin-left:5px !important">' + item.subject + '</span></a></div>';
                    str += '<div class="issuewriter-created">';
                    str += '<span class="issue-writer">' + item.create_user_name + '</span>';
                    str += '<span class="issue-created" style="margin-left:25px !important">' + item.created_at.substring(0, 10) + '</span>';
                    str += '</div></li>';

                    $('.all-issue-list').append(str);
                });
            }

            $('.all-issue-count').append(data.length);
        },
        error: function (error) {
            console.error("Error: " + error);
        }
    });
}


//검색 AJAX
function getSearchList() {
    $.ajax({
        type: "Get",
        url: "getSearchedIssue",
        data: $("form[name=search-form]").serialize(),
        dataType: "json",
//        beforeSend: function (xhr) {
//            xhr.setRequestHeader('X-CSRF-TOKEN', csrfToken);
//        },
        success: function (data) {
            $('.all-issue-list').empty();
            $('.all-issue-count').empty();
            if (data.length > 0) {
                $('.all-issue-count').append(data.length);
                data.forEach(function (item) {
                    var str = '<li class="list">';
                    str += '<div class="issuetype-wrap">';

                    if (item.type === '버그') {
                        str += '<img src="../resources/issue/img/bug.svg" class="issuetype-icon">';
                    } else if (item.type === '작업') {
                        str += '<img src="../resources/issue/img/task.svg" class="issuetype-icon">';
                    } else if (item.type === '에픽') {
                        str += '<img src="../resources/issue/img/epic.svg" class="issuetype-icon">';
                    }

                    str += '<span class="issuetype" style="margin-left:20px !important">' + item.type + '</span>';
                    str += '<a href="issue-detail?num=' + item.id + '">';
                    str += '<span class="issue-title" style="margin-left:5px !important">' + item.subject + '</span></a></div>';
                    str += '<div class="issuewriter-created">';
                    str += '<span class="issue-writer">' + item.create_user_name + '</span>';
                    str += '<span class="issue-created" style="margin-left:25px !important">' + item.created_at.substring(0, 10) + '</span>';
                    str += '</div></li>';

                    $('.all-issue-list').append(str);
                });
            } else {
                var str = '<h1 class="no-search-list">검색 결과가 없습니다.</h1>';
                $('.all-issue-list').append(str);
                $('.all-issue-count').append(data.length);
            }
        },
        error: function (error) {

        }
    });
};

//ENTER도 검색 AJAX로 처리하는 이벤트
$("#searchInput").keydown(function (event) {
    if (event.keyCode === 13) { //enter 키코드는 13번임
        event.preventDefault();
        getSearchList(); // 
    }
});
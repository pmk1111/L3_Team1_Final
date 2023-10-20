// 모달 창 열기
function openModal() {
    var modal = document.getElementById('myModal');
    modal.style.display = 'block';
}

// 모달 창 닫기
function closeModal() {
    var modal = document.getElementById('myModal');
    modal.style.display = 'none';
}

function saveSchedule() {
    $.ajax({
        type: "POST",
        url: "create-schedule",
        data: $("#scheduleForm").serialize(),
        dataType: "json",
        success: function (data) {
            if (data.rsltCd == '0') {
                alert("일정이 정상적으로 추가되었습니다.");
                closeModal();
                calendar.addEvent({
                    title: data.scheduleTitle,
                    start: data.scheduleStartDate,
                    end: data.scheduleEndDate
                });
            }
        },
        error: function (error) {

        }
    });

    function modifySchedule() {
        $.ajax({
            type: "POST",
            url: "modify_schedule",
            data: $("#scheduleForm").serialize(),
            dataType: "json",
            success: function (data) {
                if (data.rsltCd == '0') {
                    alert("일정이 정상적으로 수정되었습니다.");
                    closeModal();
                    calendar.addEvent({
                        title: data.scheduleTitle,
                        start: data.scheduleStartDate,
                        end: data.scheduleEndDate
                    });
                }
            },
            error: function (error) {

            }
        });
    }



}
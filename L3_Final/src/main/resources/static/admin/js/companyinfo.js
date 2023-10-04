// 회사명 수정
$(document).ready(function() {
    $("#nameupdate").click(function() {
        $("#companyName").prop("disabled", false);
        $("#nameupdate").addClass("d-none");
        $("#saveNameButton, #cancelNameButton").removeClass("d-none");
    });

    $("#saveNameButton").click(function() {
        $("#companyName").prop("disabled", true);
        $("#saveNameButton, #cancelNameButton").addClass("d-none");
        $("#nameupdate").removeClass("d-none");
    });

    $("#cancelNameButton").click(function() {
        $("#companyName").prop("disabled", true);
        $("#saveNameButton, #cancelNameButton").addClass("d-none");
        $("#nameupdate").removeClass("d-none");
    });

  });
//url 수정
$(document).ready(function() {
    // 수정 버튼 클릭 시
    $("#urlupdate").click(function() {
        // 입력 필드 활성화
        $("#companyDomain").prop("disabled", false);
        // 버튼 변경
        $("#urlupdate").addClass("d-none");
        $("#saveButton, #cancelButton").removeClass("d-none");
    });

    // 저장 버튼 클릭 시
    $("#saveButton").click(function() {
        // 입력 필드 비활성화
        $("#companyDomain").prop("disabled", true);
        // 버튼 변경
        $("#saveButton, #cancelButton").addClass("d-none");
        $("#urlupdate").removeClass("d-none");
    });

    // 취소 버튼 클릭 시
    $("#cancelButton").click(function() {
        // 입력 필드 비활성화
        $("#companyDomain").prop("disabled", true);
        // 버튼 변경
        $("#saveButton, #cancelButton").addClass("d-none");
        $("#urlupdate").removeClass("d-none");
    });
});
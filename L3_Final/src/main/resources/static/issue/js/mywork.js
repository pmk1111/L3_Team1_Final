$(".project").click(function(){ 
    $(this).find(".issue-list").slideToggle();
});

$(".issuetype-wrap").click(function(event){
   event.stopPropagation();
});



document.getElementById("searchButton").addEventListener("click", function() {
   var searchInput = document.getElementById("searchInput");

   // 입력 필드의 값 확인
   if (searchInput.value.trim() === "") {
       alert("검색어를 입력하세요");
   } 
   return false;
   
});
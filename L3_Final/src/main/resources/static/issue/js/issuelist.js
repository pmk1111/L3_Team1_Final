$(document).ready(function(){
 		
 		$(".issue-filter").click(function(){
 			if($(".filter-dropdown").css("display") === "none"){
 				$(".filter-dropdown").css('display', 'block').fadeIn(300);
 			} else{
 				$(".filter-dropdown").css('display', 'none').fadeOut(300);
 			}
 		})
 		
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
 	})
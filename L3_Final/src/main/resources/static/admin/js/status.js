<script>
let key = "${param.key}";
console.log(key);
if(key === "useruse"){
	
	$("#user-stop").removeClass("active");
	$("#user-wait").removeClass("active");
	$("#user-use").addClass("active");
	
	$("#userstop").removeClass("show active");
	$("#userwait").removeClass("show active");
	$("#useruse").addClass("show active");
	
}else if(key === "userstop"){
	
	$("#user-wait").removeClass("active");
	$("#user-use").removeClass("active");
	$("#user-stop").addClass("active");
	
	$("#useruse").removeClass("show active");
	$("#userwait").removeClass("show active");
	$("#userstop").addClass("show active");
	
}else if(key === "userwait"){
	
	$("#user-use").removeClass("active");
	$("#user-stop").removeClass("active");
	$("#user-wait").addClass("active");
	
	$("#userstop").removeClass("show active");
	$("#useruse").removeClass("show active");
	$("#userwait").addClass("show active");
	
}
</script>
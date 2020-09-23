$(function() {
	$('.page').click(function() {
		var page =  Number.parseInt($(this).val());
		var currentPage = Number.parseInt($('#currentPage').val());
		
		if(location.href.indexOf("&page=") == -1)
			window.location.href = location.href + "&page=" + page;
		else
			window.location.href = location.href.replace("&page=" + currentPage, "&page=" + page);
		
	});
	
	$('#search_content').keydown(function(key) {
		if(key.keyCode == 13) {
			var loc = location.href.indexOf("kind=");
			window.location.href = location.href.substring(0, loc + 9) 
				+ "target=" + $('#search_select').val() + "&search=" + $('#search_content').val();
		}
	});
	
	$(window).scroll(function() {
		if(window.scrollY > $('#board_nav_title').outerHeight(true) ) {
			$('#board_space').css("height", $('#board_navbar').outerHeight(true));
			$('#board_navbar').css({
				position: "fixed",
				top: $('header').children().outerHeight(true),
				width: $('#board_nav_title').outerWidth(true) + "px"
			});
		} else {
			$('#board_space').css("height", 0);
			$('#board_navbar').css({
				position: "",
				top: ""
			});
		}
	});
	
	$(window).resize(function() {
		$('#board_navbar').width($('#board_nav_title').width());
	});
	
	$('[data-toggle="tooltip"]').tooltip();
});
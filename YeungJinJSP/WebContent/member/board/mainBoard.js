$(function() {
	$('#next_pageBtn').click(function() {
		var next_page =  Number.parseInt($('#next_pageBtn').val()) + 1;
		
		if(location.href.indexOf("&page=") == -1)
			window.location.href = location.href + "&page=" + next_page;
		else
			window.location.href = location.href.replace("&page=" + (next_page - 1), "&page=" + next_page);
		
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
});
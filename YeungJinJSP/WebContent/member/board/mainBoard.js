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
				+ "&target=" + $('#search_select').val() + "&search=" + $('#search_content').val();
		}
	});
});
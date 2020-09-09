/**
 * 
 */

$(function() {
	// css 제어
	$(window).scroll(function() {
		if(window.scrollY > $('#content').height() - 40 - $('#nav').height()) {	// 1000 + 70 - 450
			$('#nav').css({
				position: "absolute",
				top: $('#content').height() + 70 - $('#nav').height() + "px"
			});
		} else {
			$('#nav').css({
				position: "fixed",
				top: 110 + "px"
			});
		}
	});
	
	
});
/**
 * 
 */

$(function() {
	// css 제어
	onScroll();
	
	
});

function onScroll() {
	$(window).scroll(function() {
		if(window.scrollY > $("#content").height() - 50 - $('#nav').height()) {	// 1000 + 70 - 450
			$('#nav').css({
				position: "absolute",
				top: $('#content').height() + 70 - $('#nav').height() + "px"
			});
		} else {
			$('#nav').css({
				position: "fixed",
				top: 120 + "px"
			});
		}
	});
}
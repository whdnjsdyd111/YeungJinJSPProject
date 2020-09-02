/**
 * 
 */

$(function() {
	// css 제어
	onScroll($('#content').height(), $('#nav').height());
	
});

function onScroll(conH, navH) {
	$(window).scroll(function() {
		if(window.scrollY > conH - 50 - navH) {	// 1000 + 70 - 450
			$('#nav').css({
				position: "absolute",
				top: conH + 70 - navH + "px"
			});
		} else {
			$('#nav').css({
				position: "fixed",
				top: 120 + "px"
			});
		}
	});
}
var loc;
var oriLoc = window.location.href;

$(function() {
	if(window.location.href.includes('sort')) {
		loc = oriLoc.substring(oriLoc, oriLoc.indexOf('sort') - 1);
	} else {
		loc = oriLoc;
	}
	
	$('#recent').click(function() {
		window.location.href = loc + "&sort=recent";
	});
	
	$('#recommend').click(function() {
		window.location.href = loc + "&sort=recommend";
	});
	
	$('#nonRecommend').click(function() {
		window.location.href = loc + "&sort=nonRecommend";
	});
	
	
});
function preloading(imageArray) { 
	let n = imageArray.length; 
	for (let i = 0; i < n; i++) { 
		let img = new Image(); 
		img.src = imageArray[i]; 
	} 
} 

preloading(['resource/images/index/다운로드.jfif', 'resource/images/index/다운로드.png' ]);

$(function() {
	if($('#content').width() == $('#content_add').width())
		$('#add').attr('src', 'resource/images/index/다운로드.png');
	else
		$('#add').attr('src', 'resource/images/index/다운로드.jfif');
	
	$(window).resize(function() {
		if($('#content').width() == $('#content_add').width())
			$('#add').attr('src', 'resource/images/index/다운로드.png');
		else
			$('#add').attr('src', 'resource/images/index/다운로드.jfif');
	});

	

	$(window).scroll(function() {
		if(window.scrollY > $('html').height() - $('#sidebar').height() - $('footer').height() - $('header').children().height() - 16 ) {	// 16은 1rem 값
			$('#sidebar').css({
				position: "absolute",
				top: "calc(" + ($('#content').height() / 2 - $('#sidebar').height()) + "px + 3.5rem)"
			});
		} else {
			$('#sidebar').css({
				position: "fixed",
				top: 66 + "px"
			});
		}
	});

});
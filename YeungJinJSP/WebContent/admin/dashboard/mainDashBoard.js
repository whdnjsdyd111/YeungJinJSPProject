$(function() {
	$('.new_bds').html().replace(/(<([^>]+)>)/ig, "").replace("<div><br></div>", "");
	$('.new_bds').find('img').replaceWith(function() {
		let img = "<img src='" + $(this).attr("src") + "' width='180' height='200' />";
		
		return '<span class="d-inline-block bg-danger rounded p-1 text-white" tabindex="0" data-toggle="tooltip" title="' +
		 img + '">' + "이미지</span>"
	});
	
	
	$('span[data-toggle=tooltip]').tooltip({
		html: true,
		boundary: 'window'
	});
	
	function refresh_admin() {
		$('.visitors_tooltip').tooltip('dispose');
		$('#visitors').load("/YeungJinFunnyBone/admin/dashboard/visitor.jsp");
		setTimeout(refresh_admin, 5000);
	}
	
	refresh_admin();
});
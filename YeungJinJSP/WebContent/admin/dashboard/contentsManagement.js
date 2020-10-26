var loc;
var oriLoc = window.location.href;

$(function() {
	
	
	if(oriLoc.includes('sort')) {
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
	
	$('.watch_board').click(function() {
		$('.modal').load("/YeungJinFunnyBone/admin/dashboard/contentsBoardModal.jsp?board_id=" + $(this).next().val());
	});
	
	$('.watch_comment').click(function() {
		$('.modal').load("/YeungJinFunnyBone/admin/dashboard/contentsComModal.jsp?com_id=" + $(this).next().val());
	});
	
	if(oriLoc.indexOf("board_id") >= 0) {
		let board_id = oriLoc.substring(oriLoc.indexOf("board_id=") + 9, oriLoc.length);
		$('.modal').load("/YeungJinFunnyBone/admin/dashboard/contentsBoardModal.jsp?board_id=" + board_id);
	}
	
	if(oriLoc.indexOf("com_id") >= 0) {
		let com_id = oriLoc.substring(oriLoc.indexOf("com_id=") + 7, oriLoc.length);
		$('.modal').load("/YeungJinFunnyBone/admin/dashboard/contentsComModal.jsp?com_id=" + com_id);
	}
	
	if(oriLoc.indexOf("neCom_id") >= 0) {
		let necom_id = oriLoc.substring(oriLoc.indexOf("neCom_id=") + 9, oriLoc.length);
		$('.modal').load("/YeungJinFunnyBone/admin/dashboard/contentsNestComModal.jsp?neCom_id=" + necom_id);
	}

	$('.com_content').find('img').replaceWith(function() {
		let img = "<img src='" + $(this).attr("src") + "' width='180' height='200' />";
		
		return '<span class="d-inline-block bg-danger rounded p-1 text-white" tabindex="0" data-toggle="tooltip" title="' +
		 img + '">' + "이미지</span>"
	});
	
	$('span[data-toggle=tooltip]').tooltip({
		html: true,
		boundary: 'window'
	});
	
	$('.restore_board').click(function() {
		if(confirm("복구 하시겠습니까?")) {
			$.ajax({
				type: "post",
				data: {
					board_id: $(this).next().val()
				},
				url: "restoreContents.do",
				success: function(data) {
					var str1 = "<p id='ck'>";
					var str2 = "restore_contents</p>";
					var loc1 = data.indexOf(str1);
					var loc2 = data.indexOf(str2);
					var len = str1.length;
					var check = data.substr(loc1 + len, loc2 - (loc1 + len));
					
					if(check == "1") {
						alert("복구 완료하였습니다.");
						window.location.href = "contentsManagement.do?search=deleted&sort=recent";
					} else
						alert("다시 시도해주십시오.");
				}
			});
		}
	});
	
	$('.restore_comment').click(function() {
		if(confirm("복구 하시겠습니까?")) {
			$.ajax({
				type: "post",
				data: {
					com_id: $(this).next().val()
				},
				url: "restoreContents.do",
				success: function(data) {
					var str1 = "<p id='ck'>";
					var str2 = "restore_contents</p>";
					var loc1 = data.indexOf(str1);
					var loc2 = data.indexOf(str2);
					var len = str1.length;
					var check = data.substr(loc1 + len, loc2 - (loc1 + len));
					
					if(check == "1") {
						alert("복구 완료하였습니다.");
						window.location.href = "contentsManagement.do?search=deleted&sort=recent";
					} else 
						alert("상위 콘텐츠가 삭제되어있습니다. 번호 : " + check);
				}
			});
		}
	});
	
	$('.restore_nestcomment').click(function() {
		if(confirm("복구 하시겠습니까?")) {
			$.ajax({
				type: "post",
				data: {
					neCom_id: $(this).next().val()
				},
				url: "restoreContents.do",
				success: function(data) {
					var str1 = "<p id='ck'>";
					var str2 = "restore_contents</p>";
					var loc1 = data.indexOf(str1);
					var loc2 = data.indexOf(str2);
					var len = str1.length;
					var check = data.substr(loc1 + len, loc2 - (loc1 + len));
					
					if(check == "1") {
						alert("복구 완료하였습니다.");
						window.location.href = "contentsManagement.do?search=deleted&sort=recent";
					} else
						alert("상위 콘텐츠가 삭제되어있습니다. 번호 : " + check);
				}
			});
		}
	});
	
	$('.comple_delete_board').click(function() {
		if(confirm("하위 콘텐츠들도 모두 삭제됩니다. 정말 삭제하시겠습니까?")) {
			$.ajax({
				type: "post",
				data: {
					board_id: $(this).prev().val()
				},
				url: "compleDeleteContents.do",
				success: function(data) {
					var str = "<p id='ck'>";
					var loc = data.indexOf(str);
					var len = str.length;
					var check = data.substr(loc + len, 1);
					
					if(check == "1") {
						alert("삭제 완료하였습니다.");
						window.location.href = "contentsManagement.do?search=deleted&sort=recent";
					} else
						alert("다시 시도해주십시오.");
				}
			});
		}
	});
	
	$('.comple_delete_comment').click(function() {
		if(confirm("하위 콘텐츠들도 모두 삭제됩니다. 정말 삭제하시겠습니까?")) {
			$.ajax({
				type: "post",
				data: {
					com_id: $(this).prev().val()
				},
				url: "compleDeleteContents.do",
				success: function(data) {
					var str = "<p id='ck'>";
					var loc = data.indexOf(str);
					var len = str.length;
					var check = data.substr(loc + len, 1);
					
					if(check == "1") {
						alert("삭제 완료하였습니다.");
						window.location.href = "contentsManagement.do?search=deleted&sort=recent";
					} else
						alert("다시 시도해주십시오.");
				}
			});
		}
	});
	
	$('.comple_delete_nestcomment').click(function() {
		if(confirm("정말 삭제하시겠습니까?")) {
			$.ajax({
				type: "post",
				data: {
					neCom_id: $(this).prev().val()
				},
				url: "compleDeleteContents.do",
				success: function(data) {
					var str = "<p id='ck'>";
					var loc = data.indexOf(str);
					var len = str.length;
					var check = data.substr(loc + len, 1);
					
					if(check == "1") {
						alert("삭제 완료하였습니다.");
						window.location.href = "contentsManagement.do?search=deleted&sort=recent";
					} else
						alert("다시 시도해주십시오.");
				}
			});
		}
	});
});

function delete_board(btn) {
	if(confirm("해당 콘텐츠를 지우시겠습니까?")) {
		$.ajax({
			type: "post",
			url: "deleteContents.do",
			data: {
				board_id: $(btn).prev().val()
			},
			success: function(data) {
				var str = "<p id='ck'>";
				var loc = data.indexOf(str);
				var len = str.length;
				var check = data.substr(loc + len, 1);
				
				if(check == "1"){
					alert("지우기 완료하였습니다. 삭제된 컨텐츠에서 확인 가능합니다.");
					window.location.href = "contentsManagement.do?search=deleted&sort=recent";
				} else {
					alert("지우기 실패하였습니다. 다시 시도해주십시오.");
				}
			}
		});
	}
}

function delete_comment(btn) {
	if(confirm("해당 콘텐츠를 지우시겠습니까?")) {
		$.ajax({
			type: "post",
			url: "deleteContents.do",
			data: {
				com_id: $(btn).prev().val()
			},
			success: function(data) {
				var str = "<p id='ck'>";
				var loc = data.indexOf(str);
				var len = str.length;
				var check = data.substr(loc + len, 1);
				
				if(check == "1"){
					alert("지우기 완료하였습니다. 삭제된 컨텐츠에서 확인 가능합니다.");
					window.location.href = "contentsManagement.do?search=deleted&sort=recent";
				} else {
					alert("지우기 실패하였습니다. 다시 시도해주십시오.");
				}
			}
		});
	}
}
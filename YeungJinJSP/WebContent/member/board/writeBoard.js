var check_title = false;
var check_content = false;

var image_files = [];
var image_ori_files = [];

$(function() {
	var checkload = true;
	
    $("#complete").click(function () {
        checkload = false;
    });

    $(window).on("beforeunload", function () {
        if (checkload == true) return "정말로 나가시겠습니까?";
    });

	$('#back').click(function() {
		window.history.back();
	});
	
	$('#complete').click(function() {
		checkAll();
		if(check_title && check_content) {
			var query = {
				title: $('#board_title').val(),
				content: $('#board_content').html(),
				kind: $('#board_kind option:selected').val()
			};
			
			$.ajax({
				type: "POST",
				url: "writeBoardPro.do",
				data: query,
				success: function(data) {
					var str = "<p id='ck'>";
					var loc = data.indexOf(str);
					var len = str.length;
					var check = data.substr(loc + len, 1);
					
					if(check == "1") {
						alert("게시글 작성 완료하였습니다.");
						window.location.href = "mainBoard.do";
					} else {
						window.location.href = "DBFail.do";
					}
				}
			});
		}
	});
	
	$('#insert_img').keydown(function(key) {
		if(key.keyCode == 13) {
			var img = "<img class='img-fluid img-thumbnail' src='" + 'https://' + $('#insert_img').val() + "'></br></br>";
			$('#board_content').append(img);
		}
	});
	
	$('#insert_img').on("propertychange change keyup paste input", function() {
		var image_link = $('#insert_img').val();
		image_link = image_link.replace("https://", "");
		image_link = image_link.replace("http://", "");
		
		image_link = image_link.replace(/[(\[\],<>:;"@)\\]/gi, "");
		image_link = image_link.replace(/[ㄱ-ㅎ가-힣ㅏ-ㅡ]/gi, "")
		
		$('#insert_img').val(image_link);
		
	});
	
	$(".custom-file-input").on("change", function() {
		var fileName = $(this).val().split("\\").pop();
		$(this).siblings(".custom-file-label").addClass("selected").html(fileName);
	});
	
	$('.custom-file-input').on("change", handleImageFile);
	
	$('.custom-file-input').on("change", function() {
		image_ori_files.push(this.files[0]);
	});
	
	$('#upload_image').click(function() {
		
		var form = new FormData();
		
		for(let i = 0; i < image_ori_files.length; i++) {
			form.append("file", image_ori_files[i]);
		}
		
		$.ajax({
			type: "post",
			enctype: 'multipart/form-data',
			url: "imageUpload.do",	// member/board/imageUpload.jsp
			data: form,
            processData: false,
            contentType: false,
			success: function(data) {
				alert(data);
			}
		});
	});
});

function checkAll() {
	
	check_title = true;
	check_content = true;
	
	if(!$('#board_title').val()) {
		alert("게시글 제목을 작성해주세요.");
		$('#board_title').focus();
		check_title = false;
		return false;
	}
	
	if($('#board_title').val().length > 30) {
		alert("게시글 제목은 30자 이하만 가능합니다.");
		$('#board_title').focus();
		check_title = false;
		return false;
	}
	
	if(!$('#board_content').html()) {
		alert("게시글 내용을 작성해주세요.");
		check_content = false;
		return false;
	}
}

function handleImageFile(e) {
	var file = e.target.files;
	var fileArr = Array.prototype.slice.call(file);
	
	fileArr.forEach(function (f) {	// 이런 메소드 안쓰고도 readAsDataURL 가능한지 내일 확인 및 태그 붙여놓고, 태그들을 배열로 지정한 후 게시글 작성버튼 누르면 태그의 속성 src을 업로드한 파일 경로로 바꾸기
		if(!f.type.match("image.*")) {
			alert("이미지 확장자만 가능합니다.");
			return;
		}
		
		image_files.push(f);
		
		var reader = new FileReader();
		reader.onload = function(e) {
			var img_html = "<img src='" + e.target.result + "' /><br><br>";
			$('#board_content').append(img_html);
		}
		reader.readAsDataURL(f);
	});
}
var check_title = false;
var check_content = false;

var total_file = 0;
var image_files = [];

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
			upload();
		}
	});
	
	$('#insert_img').keydown(function(key) {
		if(key.keyCode == 13) {
			var img = "<div><br></div><img class='img-fluid img-thumbnail' src='" + 'https://' + $('#insert_img').val() + "'><div><br></div>";
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
	
	$('#upload_image').click(handleImageFile);
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

function handleImageFile() {
	if(!$('#file_image').val())
		return false;
	
	total_file++;
	image_files.push($('#file_image')[0].files[0]);

	var reader = new FileReader();
	
	reader.onload = function(e) {
		var img_html = "<div><br></div><img class='img-fluid img-thumbnail' id='img" + (image_files.length - 1) + "' src='" + e.target.result + "' /><div><br></div>";
		$('#board_content').append(img_html);
	}
	
	reader.readAsDataURL(image_files[image_files.length - 1]);
	
/*	fileArr.forEach(function (f) {	// 이런 메소드 안쓰고도 readAsDataURL 가능한지 내일 확인 및 태그 붙여놓고, 태그들을 배열로 지정한 후 게시글 작성버튼 누르면 태그의 속성 src을 업로드한 파일 경로로 바꾸기
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
	});*/
	
}

function upload() {
	
	var index = 0;
	for(let i = 0; i < image_files.length; i++) {
		if(!$('#img' + i).attr('src')) {
			image_files.splice(index--, 1);
		}
		index++;
	}
	
	var form = new FormData();
	
	for(let i = 0; i < image_files.length; i++) {
		form.append("file" + i, image_files[i]);
	}
	
	$.ajax({
		type: "post",
		enctype: 'multipart/form-data',
		url: "imageUploadBoard.do",	// member/board/imageUpload.jsp
		data: form,
        processData: false,
        contentType: false,
		success: function(data) {
			var str1 = "<p id='images'>";
			var str2 = "image_p_tag</p>";
			var loc1 = data.indexOf(str1);
			var loc2 = data.indexOf(str2);
			var len = str1.length;
			var check = data.substr(loc1 + len, loc2 - (loc1 + len));
			
			var check_files = check.split(',');
			
			var index1 = check_files.length - 2;	// 2
			
			for(let i = 0; i < total_file; i++) {
				if($('#img' + i).attr('src')) {
					$('#img' + i).attr('src', check_files[index1--].trim().replace(/\\/gi, '/'));
				}
			}
			
			insert_board();
		}
	});
}

function insert_board() {
	
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
				window.location.href = "mainBoard.do?kind=all&sort=recent";
			} else {
				window.location.href = "DBFail.do";
			}
		}
	});
}
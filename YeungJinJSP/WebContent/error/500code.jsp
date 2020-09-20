<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>에러 페이지</title>
<script type="text/javascript" src="resource/js/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="/YeungJinFunnyBone/resource/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="resource/js/bootstrap.min.js"></script>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Manrope:wght@200&display=swap');

html,
body {
    height: 100%
}

body {
    display: grid;
    place-items: center;
    font-family: 'Manrope', sans-serif;
    background: #FF5252;
    color: #fff
}

.not-found {
    font-size: 220px;
    font-weight: 700
}

#search {
    -webkit-box-align: center;
    align-items: center;
    background: #dc3545;
    border-radius: 5px;
    display: -webkit-box;
    display: flex;
    -webkit-box-pack: justify;
    justify-content: space-between;
    margin: 0.5em 0;
    padding: 0.5em 0.5em 0.5em 1em;
    -webkit-transition: all 0.5s;
    transition: all 0.5s
}

#search:hover,
#search:focus {
    background: #dc3545
}

#search button,
#search input {
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    background: transparent;
    border: 0;
    color: inherit;
    font: inherit;
    outline: 0
}

#button i {
    font-size: 23px
}

#search button {
    cursor: pointer;
    padding: 0 0.25em
}

#search input {
    -webkit-box-flex: 1;
    flex: 1;
    font-weight: 500;
    font-size: 23px
}

#search input::placeholder {
    color: #fff
}

.send {
    color: #fff;
    background-color: #dc3545;
    border-color: #dc3545;
    border-radius: 1px;
    box-shadow: 2px 3px #dc3545
}

.send:hover {
    color: #fff;
    background-color: #dc3545;
    border-color: #dc3545;
    border-radius: 1px;
    box-shadow: 2px 3px #dc3545
}
</style>
</head>
<body>
	
<% response.setStatus(HttpServletResponse.SC_OK); %>
	
	
<div class="container-fluid text-center">
    <div class="row">
        <div class="col-md-6 pull-right"> <img src="https://i.imgur.com/1dJs49H.png" width="400" class="mt-2"> </div>
        <div class="col-md-6">
            <div class="pull-left">
                <h1 class="not-found">505</h1>
                <h3>서버에 문제가 발생하였습니다!</h3>
                <div class="text-center mt-4 mb-5"> 
                	<a class="btn btn-success send px-3" href="mainBoard.do?kind=all&sort=pop">
                		<i class="fa fa-long-arrow-left mr-1"></i>메인으로 가기</a> 
        
            	</div>
       	 	</div>
    	</div>
    </div>
</div>
</body>
</html>
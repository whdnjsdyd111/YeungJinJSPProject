<%@page import="java.util.Date"%>
<%@page import="main.bean.ChatLogDataBean"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%!
	private String addZero(int time) {
		if(time < 10)
			return "0" + time;
		else
			return "" + time;
	}
%>
<fieldset>
	<article class="d-flex flex-column overflow-auto bg-info	" id="chat_room" style="max-height: 500px">
	<c:forEach var="chat" items="${ chattings }">
		<c:choose>
			<c:when test="${ chat.admin_id == sessionScope.YJFBID_ADMIN_SES }">
				<div class="d-flex justify-content-end p-1">
					<div class="d-flex flex-column">
						<span class="font-weight-bold text-right pr-3"><i class="fa fa-address-card mr-2"></i>나</span>
						<div class="p-3">
							<span class="mr-2">
								<%
									Date date = new Date(((ChatLogDataBean) pageContext.getAttribute("chat")).getChat_time().getTime());
									
									out.print(addZero(date.getMonth() + 1) + "." + 
										addZero(date.getDate()) + " " + addZero(date.getHours()) + ":" + addZero(date.getMinutes()));
								%>
							</span>
							<span class="bg-warning text-dark p-2 rounded chat_message">${ chat.chat_content }</span>
						</div>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="d-flex justify-content-start flex-column p-1">
					<span class="font-weight-bold pl-3"><i class="fa fa-id-card mr-2"></i>${ chat.admin_name }</span>
					<div class="p-3">
						<span class="bg-dark text-white p-2 rounded chat_message">${ chat.chat_content }</span>
						<span>
							<%
								Date date = new Date(((ChatLogDataBean) pageContext.getAttribute("chat")).getChat_time().getTime());
								
								out.print(addZero(date.getMonth() + 1) + "." + 
									addZero(date.getDate()) + " " + addZero(date.getHours()) + ":" + addZero(date.getMinutes()));
							%>
						</span>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	</article>
	<div class="input-group">
		<input id="inputMessage" type="text" class="form-control" placeholder="메시지 입력" aria-describedy="send">
		<div class="input-group-append" id="send">
			<button class="btn btn-outline-warning" type="button">보내기<i class="fa fa-caret-square-o-right ml-2"></i></button>
		</div>
	</div>
</fieldset>
<script>
	var webSocket = new WebSocket('ws://localhost:8001/YeungJinFunnyBone/chatting');
	
	webSocket.onerror = function(event) { onError(event) };
	webSocket.onopen = function(event) { onOpen(event) };
	webSocket.onmessage = function(event) { onMessage(event) };
	
	$(function() {
		$(window).on('beforeunload', function () {
			webSocket.send("${ admin_member.admin_name } 님이 퇴장하였습니다.\n");
			webSocket.close();
			console.log("웹 소켓 종료");
		});
	});

	function onMessage(event) {
		try {
			let arr = JSON.parse(event.data);
			
			let tag = 
				'<div class="d-flex justify-content-start flex-column p-1">' +
				'<span class="font-weight-bold pl-3"><i class="fa fa-id-card mr-2"></i>' +
				arr["name"] + '</span>' +
				'<div class="p-3">' +
				'<span class="bg-dark text-white p-2 rounded chat_message">' +
				arr["message"] +
				'</span>' +
				'<span>' +
				arr["time"] +
				'</span>' +
				'</div>' +
				'</div>';
				
			$('#chat_room').append(tag);
			$('#chat_room').scrollTop($('#chat_room').prop('scrollHeight'));
		} catch (error) {
			$('#chat_room').append("<p class='bg-success rounded p-2'>" + event.data + "</p>");
			$('#chat_room').scrollTop($('#chat_room').prop('scrollHeight'));
		}
		
	}
	
	function onOpen(event) {
	    webSocket.send("${ admin_member.admin_name } 님이 입장하였습니다.\n");
	}
	
	function onError(event) {
		alert(event.data);
	}
	
	function send() {
		let date = new Date();
		
		let tag = 
			'<div class="d-flex justify-content-end p-1">' +
			'<div class="d-flex flex-column">' +
			'<span class="font-weight-bold text-right pr-3"><i class="fa fa-address-card mr-2"></i>나</span>' +
			'<div class="p-3">' +
			'<span class="mr-2">' +
			addZero(date.getMonth()) + '.' + addZero(date.getDate()) + ' ' + addZero(date.getHours()) + ':' + addZero(date.getMinutes()) +
			'</span>' +
			'<span class="bg-warning text-dark p-2 rounded chat_message">' +
			$('#inputMessage').val() +
			'</span>' +
			'</div>' +
			'</div>' +
			'</div>';
		
		$('#chat_room').append(tag);
		
		webSocket.send(JSON.stringify({
			id: ${ sessionScope.YJFBID_ADMIN_SES },
			message: $('#inputMessage').val()
		}));
		
		$('#inputMessage').val("");
		
		$('#chat_room').scrollTop($('#chat_room').prop('scrollHeight'));
	}
	
	function addZero(data) {
		if(data < 10)
			return '0' + data;
		else
			return data;
	}
	
	$(function() {
		$('#chat_room').scrollTop($('#chat_room').prop('scrollHeight'));
		
		$('#send').click(function() {
			send();
		});
	})
</script>
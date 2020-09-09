<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script type="text/javascript" src="member/login/dialog.js"></script>
<div id="dialog" class="dialog_radius dialog_padding5" style="display: none;">
	<table width="100%">
		<tr>
			<td class="dialog_title">
				이메일 인증
			</td>
			<td class="dialog_cancel" onclick="closeDialog();">
				X
			</td>
		</tr>
		<tr>
			<td class="dialog_content">
				<div class="dialog_alert">
					사용자님의 (<label id="dialog_email" ></label>) 계정은 이메일 인증이 완료되지 않았습니다.
				</div>
			</td>
		</tr>
		<tr>
			<td class="dialog_right">
				<span class="dialog_span">메일을 받지 못하셨나요?</span><a id="reSend" class="reSend">메일 다시 보내기</a>
			</td>
		</tr>
	</table>
</div>
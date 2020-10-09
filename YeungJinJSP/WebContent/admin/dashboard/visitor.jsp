<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row font-weight-bolder mt-3 d-flex flex-md-row">
	<c:forEach var="visitor" items="${ applicationScope }">
		<c:if test="${ !empty visitor.value.getClass() }">
			<c:if test="${ visitor.value.getClass().getSimpleName() eq 'JoinMemberAdminDataBean' }">
				<span class="d-inline-block ml-2 visitors_tooltip" tabindex="0" data-toggle="tooltip" title="
					<div class='d-flex flex-column'>
						<span>연락처<br>${ visitor.value.admin_phone }</span>
						<span>이메일 <br>${ visitor.value.mem_email }</span>
					</div>">
					<div class="d-flex flex-column">
						<i class="fa fa-id-badge fa-5x mt-2"></i>
						<span class="mt-2 ml-1">${ visitor.value.admin_name }</span>
					</div>
				</span>
				<script type="text/javascript">
					$('.visitors_tooltip').tooltip({
						html: true,
						boundary: 'window'
					});
				</script>
			</c:if>
		</c:if>
	</c:forEach>
</div>
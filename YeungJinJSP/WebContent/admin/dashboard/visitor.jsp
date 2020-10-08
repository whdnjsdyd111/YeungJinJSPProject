<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${ !empty applicationScope }">
	<div class="row">
		<i class="fa fa-id-badge fa-5x mt-2 col ml-4"></i>
		<c:forEach begin="0" end="${ applicationScope.size() - 1 }" step="1">
			<i class="fa fa-id-badge fa-5x mt-2 col"></i>
		</c:forEach>
	</div>
	<div class="row font-weight-bolder ml-3 mt-3">
		<c:forEach var="visitor" items="${ applicationScope }">
			
		</c:forEach>
	</div>
</c:if>

<div class="row">
	<i class="fa fa-id-badge fa-5x mt-2 col ml-4"></i>
	<i class="fa fa-id-badge fa-5x mt-2 col"></i>
	<i class="fa fa-id-badge fa-5x mt-2 col"></i>
	<i class="fa fa-id-badge fa-5x mt-2 col"></i>
</div>
<div class="row font-weight-bolder ml-3 mt-3">
	<span class="col">조원용</span>
	<span class="col">조원용</span>
	<span class="col">조원용</span>
	<span class="col">조원용</span>
</div>
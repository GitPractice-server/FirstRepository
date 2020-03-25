<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" isELIgnored="false"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix='fmt' %>

111

<table align='center' border='1' cellspacing='0'>
	<tr>
		<td>商品名称</td>
		<td>购买数量</td>
		<td>小计</td>
	</tr>
	<c:forEach items="${ois}" var="oi" varStatus="st">
		<tr>
			<td>${oi.product.name}</td>
			<td>${oi.num}</td>
			<td><fmt:formatNumber type="number" value="${oi.product.price*oi.num}" maxFractionDigits="2" /></td>
			<td>
		</tr>
	</c:forEach>
</table>
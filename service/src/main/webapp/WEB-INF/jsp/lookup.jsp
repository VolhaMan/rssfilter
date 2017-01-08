<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <script src="/resources/js/lookup.js"></script>
    <link rel="stylesheet" type="text/css" href="/resources/css/lookup.css">
    <title>Youtube rss feed filter</title>
</head>
<body onload="setStyle();">
<jsp:include page="header.jsp"/>
<div id="channelsList">
    <table width="930px;">
        <c:if test="${not empty channels}">
            <tr>
                <td colspan="2"><h4>Choose your channel:<br/></h4></td>
            </tr>
        </c:if>
        <tr></tr>
        <c:forEach var="channel" items="${channels}">
            <tr onclick="processChannel(this, '${channel.channelId}');" name="channelRow" class="channelRow">
                <td><img name="channelIcon" src="${channel.imageUrl}" width="60px" height="60px"></td>
                <td>
                    <div name="channelTitle">${channel.title}</div>
                    <div name="channelDescription">${channel.description}</div>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>
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
<body>
<jsp:include page="header.jsp"/>
<div id="search-result-header">
    <div id="title-lookup">
        <c:if test="${not empty channels}">
            <h1>Please select your YouTube channel</h1>
        </c:if>
        <c:if test="${not empty defaultSearch}">
            <p>Search results for query '${defaultSearch}':</p>
        </c:if>
    </div>
</div>
<div id="search-result">
    <div id="channels">
        <c:forEach var="channel" items="${channels}">
            <div class="channel-row">
                <div class="channel-image">
                    <a href=/filter?channelId=${channel.channelId}">
                        <img src="${channel.imageUrl}" alt="${channel.title}"/>
                    </a>
                </div>
                <div class="channel-body">
                    <a href=/filter?channelId=${channel.channelId}">
                        <h2>${channel.title}</h2>
                    </a>

                    <p>${channel.description}</p>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>
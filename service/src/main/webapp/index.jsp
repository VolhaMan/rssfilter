<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <script src="/resources/js/lookup.js"></script>
    <link rel="stylesheet" type="text/css" href="/resources/css/lookup.css">
    <title>Video2Feed</title>
</head>
<body>
<jsp:include page="WEB-INF/jsp/header.jsp" />
<div id="main-block">
    <div id="main-text">
        <h1>FILTERED RSS FOR ANY YOUTUBE CHANNEL</h1>
        <h4>Watch only videos interesting for you from your favorite youtube channels!
            You can set keywords and we will generate for you RSS feed which will have only matched videos.</h4>
    </div>
    <div id="main-search">
        <form id="searchForm" action="/lookup" method="get">
            <input id="channelSearchKeyword" name="query" type="search" value="${defaultSearch}"
                   placeholder="Enter YouTube channel name"
                   class="input-style"/>
            <button type="submit" id="search-button" value="Search"/>
        </form>
    </div>
    <div id="statistic">
        <span class="statistic-block">1027 feeds created</span>
        <span class="statistic-block">10211 requests proceeded</span>
    </div>
    <jsp:include page="WEB-INF/jsp/footer.jsp"/>
</div>
</body>
</html>
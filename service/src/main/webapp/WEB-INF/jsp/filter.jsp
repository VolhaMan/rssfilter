<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <script src="/resources/js/lookup.js"></script>
    <link rel="stylesheet" type="text/css" href="/resources/css/lookup.css">
    <title>Youtube rss feed filter</title>
    <script language="javascript">

        function showRss() {
            var keyword = document.getElementById("rss-keyword").value;

            document.getElementById("rss-link").style.display = "block";
            var location = window.location.host;

            var link = document.getElementById("rss-link");

            link.value = location + "/rssfilter?id=" + "${channel.channelId}" + "&keyword=" + keyword;
        }

    </script>
</head>
<body>
<jsp:include page="header.jsp"/>
<c:if test="${empty channel}">
    <div id="channel-not-found">Channel not found.</div>
</c:if>
<c:if test="${not empty channel}">
    <div class="lookup-channel">
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

        <input id="rss-keyword" type="text" placeholder="Enter filter keyword" />
        <button type="button" name="Create feed" onclick="showRss();"></button>
        <input id="rss-link" type="text"/>
        <button type="button" value="Copy link" onclick="copyToClipboard()"/>
    </div>
</c:if>
<jsp:include page="footer.jsp"/>
</body>
</html>
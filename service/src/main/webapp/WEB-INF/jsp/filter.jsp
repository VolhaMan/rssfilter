<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <script src="/resources/js/lookup.js"></script>
    <link rel="stylesheet" type="text/css" href="/resources/css/lookup.css">
    <title>Youtube rss feed filter</title>

</head>
<body>
<jsp:include page="header.jsp"/>
<c:if test="${empty channel}">
    <div id="channel-not-found">Channel not found.</div>
</c:if>
<c:if test="${not empty channel}">
    <script language="javascript">

        function showRss() {
            var keyword = encodeURI(document.getElementById("rss-keyword").value);

            document.getElementById("lookup-input-block-feed").style.display = "inline-block";
            var location = window.location.host;

            var link = document.getElementById("rss-link");
            link.value = location + "/rssfilter?id=" + encodeURI("${channel.channelId}") + "&keyword=" + keyword;
        }

    </script>
    <div class="lookup-channel">
        <div class="lookup-description">
            <div class="lookup-body">
                <div id="channel-banner"><img src="${channel.bannerUrl}"/></div>
                <div class="lookup-image">
                    <a href="//youtube.com/channel/${channel.channelId}">
                        <img src="${channel.imageUrl}" alt="${channel.title}"/>
                    </a>
                </div>
                <a href="//youtube.com/channel/${channel.channelId}">
                    <h2>${channel.title}</h2>
                </a>
                <div id="channel-statistic">
                    <span class="stat">${channel.uploads} uploads</span>
                    <span class="stat">${channel.subscribers} subscribers</span>
                    <span class="stat">${channel.videoViews} video views</span>
                </div>
                <p>${channel.description}</p>

                <div >
                    <input class="lookup-input" id="rss-keyword" type="text" placeholder="Enter filter keyword"/>

                    <span class="lookup-button-block">
                        <input class="lookup-button" type="button" value="Create feed" onclick="showRss();"/>
                    </span>
                </div>
                <div id="lookup-input-block-feed">
                    <input class="lookup-input" id="rss-link" type="text"/>

                    <span class="lookup-button-block">
                        <input class="lookup-button" type="button" value="Copy link" onclick="copyToClipboard();"/>
                    </span>
                </div>
            </div>
        </div>
    </div>
    <br/>
</c:if>
<jsp:include page="footer.jsp"/>
</body>
</html>
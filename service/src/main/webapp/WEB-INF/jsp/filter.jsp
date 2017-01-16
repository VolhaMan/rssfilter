<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <script src="/resources/js/lookup.js"></script>
    <link rel="stylesheet" type="text/css" href="/resources/css/lookup.css">
    <title>Video2Feed - rss feed for youtube channel</title>
    <meta name="description" content="Watch only videos interesting for you from your favorite youtube channels!
    You can set keywords and we will generate for you RSS feed which will have only matched videos. "/>
    <meta name="keywords" content="rss feed, rss, feed, youtube, youtube channel, channel, video, filter, keyword, generate,
    "/>
</head>
<body>
<spring:htmlEscape defaultHtmlEscape="true"/>
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

            var linkInput = document.getElementById("rss-link");
            var href = location + "/rssfilter?id=" + encodeURI("${channel.channelId}") + "&keyword=" + keyword;

            linkInput.value = href;
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
                    <h2>Generate RSS feed for channel '${channel.title}'</h2>
                </a>
                <div id="channel-statistic">
                    <span class="stat">${channel.uploads} uploads</span>
                    <span class="stat">${channel.subscribers} subscribers</span>
                    <span class="stat">${channel.videoViews} video views</span>
                </div>
                <!--<p>${channel.description}</p>-->

                <div id="filter-form">
                    <h3>Specify filter criteria</h3>
                    <div class="lookup-form-description">RSS feed will contain only those videos which has specified phrase in title or description.
                        You can leave keyword field blank and RSS feed will contain all videos from this channel.</div>
                    <div>
                        <input class="lookup-input" id="rss-keyword" type="text" placeholder="Enter filter criteria" onkeyup="submitOnEnter();"/>
                        <span class="lookup-button-block">
                            <input id="filter-button" class="lookup-button" type="button" value="Generate" onclick="showRss();"/>
                        </span>
                    </div>
                    <div id="lookup-input-block-feed">
                        <h3>Your RSS feed has been generated</h3>
                        <div class="lookup-form-description">You can copy the link and add it to your RSS reader application.</div>
                        <input class="lookup-input" id="rss-link" type="text"
                                                                      readonly="true"/>
                    <span class="lookup-button-block">
                        <input class="lookup-button" type="button" value="Copy link" onclick="copyToClipboard();"/>
                    </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br/><br/>
</c:if>
<jsp:include page="footer.jsp"/>
</body>
</html>
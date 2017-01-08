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
<div id="rssFilter">
    <table width="930px">
        <tr>
            <td>
                <input id="rssUrl" type="text" value="${rssUrl}" readonly/>
            </td>
        </tr>
        <tr>
            <td>
        <input id="rssKeyword" type="text"/>
            </td>
        </tr>
        <tr>
            <td>
        <input id="rssButton" type="button" value="Get feed" onClick="showRss();"/>
            </td>
        </tr>
    </table>
</div>
<div id="filteredRssFeed"><a id="rssFeedLink"></a> <input type="button" value="Cope link" onclick="copyToClipboard();"/>
</div>
</body>
</html>
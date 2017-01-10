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
<div id="header-wrapper">
    <div id="header">
    </div>
</div>
<div id="logo-search-wrapper">
    <div id="logo-search">
        <div id="logo">
            <a href="/">
                <img src="/resources/images/logo.png" class="logo-image"/>
                <span class="logo-text">VIDEO2FEED</span>
            </a>
        </div>

        <div id="top-search">
            <form id="top-search-form" action="/lookup" method="get">
                <div id="top-search-holder">
                    <span class="youtube-icon">&nbsp;</span>
                    <input id="topChannelSearchInput" name="query" type="search"
                           placeholder="Enter YouTube channel name"/>
                    <button type="submit" value="Search" class="top-search-button">
                        <span class="fa">
                            &nbsp;
                        </span>
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
<div id="top-red-line">
</div>
</body>
</html>

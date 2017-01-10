/**
 * Created by volha on 12/28/16.
 */
function setDefaultValueOnBlur() {
    var input = document.getElementById("channelSearchKeyword");
    if (input.value == "") {
        input.value = "Enter youtube channel name";
        input.style.color = "#AAAAAA";
        input.style.fontWeight = "normal";
    }
}

function cleanOnFocus() {
    var input = document.getElementById("channelSearchKeyword");
    if (input.value == "Enter youtube channel name") {
        input.value = "";
        input.style.color = "#000000";
        input.style.fontWeight = "bold";
    }
}
function selectChannel(channel, channelId) {
    hideChannelsList();
    document.getElementById("rssUrl").value = "https://www.youtube.com/feeds/videos.xml?channel_id=" + channelId;
    document.getElementById("rssButton").disabled = false;
    document.getElementById("rssKeyword").disabled = false;
}

function processChannel(channel, channelId) {
    window.location.href = "/filter?channelId=" + channelId;
}

function hideChannelsList() {
    document.getElementById("channelsList").style.display = "none";
}



function copyToClipboard() {
    var text = document.getElementById("rss-link").value;

    if (window.clipboardData && window.clipboardData.setData) {

        return clipboardData.setData("Text", text);

    } else if (document.queryCommandSupported && document.queryCommandSupported("copy")) {
        var textarea = document.createElement("textarea");
        textarea.textContent = text;
        textarea.style.position = "fixed";
        document.body.appendChild(textarea);
        textarea.select();
        try {
            return document.execCommand("copy");
        } catch (ex) {
            console.warn("Copy to clipboard failed.", ex);
            return false;
        } finally {
            document.body.removeChild(textarea);
        }
    }
}
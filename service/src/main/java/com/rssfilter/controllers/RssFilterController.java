package com.rssfilter.controllers;

import com.rssfilter.feeds.RSSFeed;
import com.rssfilter.serach.ChannelsSearch;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * returns filtered feed
 */
@Controller
@RequestMapping("/rssfilter")
public class RssFilterController {
    private RSSFeed feed;
    private ChannelsSearch channelsSearch;

    @Autowired
    public void setFeed(RSSFeed feed) {
        this.feed = feed;
    }

    @Autowired
    public void setChannelsSearch(ChannelsSearch channelsSearch) {
        this.channelsSearch = channelsSearch;
    }

    @RequestMapping(method = RequestMethod.GET, produces = "application/xml")
    public void getRss(HttpServletResponse response, @RequestParam("url") String url, @RequestParam("keyword") String keyword) {
        try {
            response.setCharacterEncoding("UTF-8");
            feed.obtain(url, keyword);
            feed.write(response.getWriter());
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}

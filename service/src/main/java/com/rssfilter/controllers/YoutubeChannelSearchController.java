package com.rssfilter.controllers;

import com.rssfilter.entities.YoutubeChannel;
import com.rssfilter.serach.ChannelsSearch;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class YoutubeChannelSearchController {
    private ChannelsSearch channelsSearch;

    @Value("${youtube.baserssurl}")
    private String BASE_RSS;

    @Autowired
    public void setChannelsSearch(ChannelsSearch channelsSearch) {
        this.channelsSearch = channelsSearch;
    }

    @RequestMapping(value = "/lookup", method = RequestMethod.GET, params = "query")
    public ModelAndView search(@RequestParam("query") String keyword) {
        List<YoutubeChannel> channels = channelsSearch.getChannelsList(keyword);

        ModelAndView modelAndView = new ModelAndView("lookup");
        modelAndView.addObject("channels", channels);
        modelAndView.addObject("defaultSearch", keyword);
        return modelAndView;
    }

    @RequestMapping(value = "/lookup", method = RequestMethod.GET)
    public String pass() {
        return "lookup";
    }

    @RequestMapping(value = "/filter", method = RequestMethod.GET)
    public ModelAndView filter(@RequestParam("channelId") String channelId) {
        ModelAndView model = new ModelAndView("filter");
        YoutubeChannel channel = channelsSearch.getChannel(channelId);
        model.addObject("channel",channel);
        return model;
    }
}
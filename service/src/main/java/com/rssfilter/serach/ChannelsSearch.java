package com.rssfilter.serach;

import com.rssfilter.entities.YoutubeChannel;

import java.util.List;

/**
 * Created by Best Java Developer!.
 */
public interface ChannelsSearch {
    List<YoutubeChannel> getChannelsList(String keyword);
}

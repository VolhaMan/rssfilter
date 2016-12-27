package com.rssfilter.serach;

import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.services.youtube.YouTube;
import com.google.api.services.youtube.model.ResourceId;
import com.google.api.services.youtube.model.SearchListResponse;
import com.google.api.services.youtube.model.SearchResult;
import com.rssfilter.entities.YoutubeChannel;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * Created by Best Java Developer!.
 */
@Component
public class YoutubeApiChannelSearch implements ChannelsSearch {
    @Value("${youtube.apikey}")
    private String apiKey;

    @Value("${youtube.channels.count}")
    private long NUMBER_OF_CHANNELS_RETURNED;

    @Override
    public List<YoutubeChannel> getChannelsList(String keyword) {
        List<YoutubeChannel> channels = new ArrayList<>();
        if(keyword != null && !keyword.equals("")) {
            YouTube youtube = new YouTube.Builder(new NetHttpTransport(), new JacksonFactory(), request -> {
            }).setApplicationName("rssfilter").build();

            try {
                YouTube.Search.List search = youtube.search().list("id, snippet");
                search.setKey(apiKey);
                search.setQ(keyword);
                search.setType("channel");
                search.setMaxResults(NUMBER_OF_CHANNELS_RETURNED);

                SearchListResponse searchResponse = search.execute();
                List<SearchResult> searchResultList = searchResponse.getItems();

                if(searchResultList != null) {
                    Iterator iterator = searchResultList.iterator();

                    while(iterator.hasNext()) {
                        SearchResult result = (SearchResult) iterator.next();
                        ResourceId resourceId = result.getId();

                        if(resourceId.getKind().equals("youtube#channel")) {
                            YoutubeChannel channel = new YoutubeChannel();
                            channel.setChannelId(result.getSnippet().getChannelId());
                            channel.setTitle(result.getSnippet().getTitle());
                            channel.setDescription(result.getSnippet().getDescription());
                            channel.setImageUrl(result.getSnippet().getThumbnails().getDefault().getUrl());

                            channels.add(channel);
                        }
                    }
                }

            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        return channels;
    }
}

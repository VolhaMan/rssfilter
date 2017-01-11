package com.rssfilter.entities;

import java.math.BigInteger;
import java.util.Date;

/**
 * Youtube channel entity
 */
public class YoutubeChannel {
    private String title;
    private String channelId;
    private String imageUrl;
    private String description;
    private String bannerUrl;
    private BigInteger uploads;
    private BigInteger subscribers;
    private BigInteger videoViews;

    public String getTitle() {
        return this.title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getChannelId() {
        return this.channelId;
    }

    public void setChannelId(String channelId) {
        this.channelId = channelId;
    }

    public String getImageUrl() {
        return this.imageUrl;
    }

    public void setImageUrl(String immageUrl) {
        this.imageUrl = immageUrl;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getBannerUrl() {
        return bannerUrl;
    }

    public void setBannerUrl(String bannerUrl) {
        this.bannerUrl = bannerUrl;
    }

    public BigInteger getUploads() {
        return uploads;
    }

    public void setUploads(BigInteger uploads) {
        this.uploads = uploads;
    }

    public BigInteger getSubscribers() {
        return subscribers;
    }

    public void setSubscribers(BigInteger subscribers) {
        this.subscribers = subscribers;
    }

    public BigInteger getVideoViews() {
        return videoViews;
    }

    public void setVideoViews(BigInteger videoViews) {
        this.videoViews = videoViews;
    }
}

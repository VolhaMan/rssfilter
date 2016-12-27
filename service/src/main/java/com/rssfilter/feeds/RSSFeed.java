package com.rssfilter.feeds;

import java.io.Writer;

public interface RSSFeed {
    void obtain(String url);
    void obtain(String url, String keyword);
    void write(Writer writer);
}

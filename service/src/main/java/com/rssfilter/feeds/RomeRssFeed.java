package com.rssfilter.feeds;

import com.sun.syndication.feed.synd.SyndEntry;
import com.sun.syndication.feed.synd.SyndFeed;
import com.sun.syndication.io.FeedException;
import com.sun.syndication.io.SyndFeedInput;
import com.sun.syndication.io.SyndFeedOutput;
import com.sun.syndication.io.XmlReader;
import org.jdom.Content;
import org.jdom.Element;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.io.Writer;
import java.net.URL;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * Allow to obtain, filter and write rss feed using ROME
 */
@Component
public class RomeRssFeed implements RSSFeed {
    static final String URL_NOT_SPECIFIED = "URL is not specified";
    private SyndFeed feed;

    @Override
    public void obtain(String url) {
        if (url == null || url.equals("")) {
            throw new IllegalArgumentException(URL_NOT_SPECIFIED);
        }

        try {
            URL rssUrl = new URL(url);
            SyndFeedInput input = new SyndFeedInput();
            feed = input.build(new XmlReader(rssUrl));
        } catch (FeedException | IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void obtain(String url, String keyword) {
        obtain(url);

        if (keyword != null && !keyword.equals("")) {
            keyword = keyword.toLowerCase().trim();
            Iterator feedIterator = feed.getEntries().iterator();

            while (feedIterator.hasNext()) {
                SyndEntry entry = (SyndEntry) feedIterator.next();

                String title = entry.getTitle().toLowerCase();
                ArrayList<Element> elements = (ArrayList<Element>) entry.getForeignMarkup();

                if (!title.contains(keyword)) {
                    //Trying to get youtube description. Gets description only if title doesn't contain keyword.
                    String description = "";

                    for (Element element : elements) {
                        if ("group".equals(element.getName()) && "media".equals(element.getNamespacePrefix())) {
                            List<Content> subElements = element.getContent();
                            for (Content subElement : subElements) {
                                if (subElement instanceof Element) {
                                    if ("description".equals(((Element) subElement).getName())) {
                                        description = subElement.getValue().toLowerCase();
                                    }
                                }
                            }
                        }
                    }

                    if (!description.contains(keyword)) {
                        feedIterator.remove();
                    }
                }
            }
        }
    }

    @Override
    public void write(Writer writer) {
        try {
            SyndFeedOutput output = new SyndFeedOutput();
            output.output(feed, writer);
        } catch(FeedException | IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public String toString() {
        try {
            SyndFeedOutput output = new SyndFeedOutput();
            return output.outputString(feed);
        } catch(FeedException e) {
            e.printStackTrace();
        }

        return super.toString();
    }
}

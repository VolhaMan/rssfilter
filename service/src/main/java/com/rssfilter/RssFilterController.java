package com.rssfilter;

import com.sun.syndication.feed.synd.SyndEntry;
import com.sun.syndication.feed.synd.SyndFeed;
import com.sun.syndication.io.SyndFeedInput;
import com.sun.syndication.io.SyndFeedOutput;
import com.sun.syndication.io.XmlReader;
import org.jdom.Content;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URL;

import org.jdom.Element;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;


/**
 * Implements rss filtering by specified keyword ignore register
 */
@Controller
@RequestMapping("/rssfilter")
public class RssFilterController {
    @RequestMapping(method = RequestMethod.GET, produces = "application/xml")
    public void getRss(HttpServletRequest request, HttpServletResponse response, @RequestParam("url") String url, @RequestParam("keyword") String keyword) {
        try {
            request.setCharacterEncoding("UTF-8");
            keyword = keyword.toLowerCase();
            URL rssUrl = new URL(url);
            SyndFeedInput input = new SyndFeedInput();
            SyndFeed feed = input.build(new XmlReader(rssUrl));
            feed.setEncoding("UTF-8");
            Iterator feedIterator = feed.getEntries().iterator();
            while (feedIterator.hasNext()) {
                SyndEntry entry = (SyndEntry) feedIterator.next();
                String description = "";
                String title = entry.getTitle().toLowerCase();
                ArrayList<Element> elements = (ArrayList<Element>) entry.getForeignMarkup();

                //Trying to get youtube description
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

                if (!title.contains(keyword) && !description.contains(keyword)) {
                    feedIterator.remove();
                }
            }

            SyndFeedOutput output = new SyndFeedOutput();
            response.setCharacterEncoding("UTF-8");
            output.output(feed, response.getWriter());

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}

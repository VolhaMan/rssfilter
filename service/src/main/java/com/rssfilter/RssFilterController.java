package com.rssfilter;

import com.sun.syndication.feed.synd.SyndContent;
import com.sun.syndication.feed.synd.SyndEntry;
import com.sun.syndication.feed.synd.SyndFeed;
import com.sun.syndication.io.SyndFeedInput;
import com.sun.syndication.io.SyndFeedOutput;
import com.sun.syndication.io.XmlReader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.w3c.dom.Document;

import javax.servlet.http.HttpServletResponse;
import java.net.URL;
import java.util.Iterator;


/**
 * Created by volha on 12/22/16.
 */
@Controller
@RequestMapping("/rssfilter")
public class RssFilterController {
    @RequestMapping(method = RequestMethod.GET, produces = "application/xml")
    public void getRss(HttpServletResponse response, @RequestParam("url") String url, @RequestParam("keyword") String keyword) {
        try {
            keyword = keyword.toLowerCase();
            URL rssUrl = new URL(url);
            SyndFeedInput input = new SyndFeedInput();
            SyndFeed feed = input.build(new XmlReader(rssUrl));
            feed.setEncoding("UTF-8");
            Iterator feedIterator = feed.getEntries().iterator();
            while (feedIterator.hasNext()) {
                SyndEntry entry = (SyndEntry) feedIterator.next();
                String  description = entry.getDescription() != null ? entry.getDescription().getValue().toLowerCase() : "";
                String title = entry.getTitle().toLowerCase();
                if (!title.contains(keyword) && !description.contains(keyword)) {
                    feedIterator.remove();
                }
            }
            SyndFeedOutput output = new SyndFeedOutput();
            String string = output.outputString(feed);
            response.setCharacterEncoding("UTF-8");
            output.output(feed, response.getWriter());

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}

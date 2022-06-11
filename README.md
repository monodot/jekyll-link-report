# jekyll-link-report

Plugin for [Jekyll][jekyll] to generate a report which shows the **internal links** on every post and page on your Jekyll website.

It runs after Jekyll generates the HTML, and counts any links where the `href` starts with `/`.

It runs on every `jekyll build`, and writes a link report to the console.

## What is this for?

Uhh..... what would you use this plugin for?

- For Jekyll sites which are becoming large, and you want to be able to analyse them for SEO.

- Monitoring the number of internal links on each page.

- Finding out which pages currently have no links, or finding out which pages have lots of links.

- Merging the report with data from Google Analytics or Google Search Console, to find out where you should be adding more internal links (by helping PageRank/authority to flow to other pages on your site)

## How to use

This is very much _alpha_ software, and my first bit of Ruby code, so I haven't figured out how to publish it as a Ruby Gem yet. 🤡

So, if you want to use this plugin:

**1.** Clone this repository.

**2.** In your Jekyll site, add the following line into your `Gemfile` (inside the `group :jekyll_plugins` block):

```
gem 'jekyll-link-report', '0.1.0', :path => '/path/to/where/you/cloned/jekyll-link-report'
```

**3.** Build your site as normal (`jekyll build`), and a rough report will be written to the console.

## Future improvements

- Creating a CSV

- Turning into a Ruby Gem and releasing properly


[jekyll]: https://jekyllrb.com/

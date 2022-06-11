# require "jekyll"
# require "jekyll-link-report/version"
require "nokogiri"

module Jekyll
  module LinkReport
    DEFAULT_MESSAGE = "henlo"

    class << self
      def doc_link_report(doc)
        Jekyll.logger.info "**********************************"
        # Jekyll.logger.info doc
        data = doc.data
        # Jekyll.logger.info data
        # Jekyll.logger.info data["relative_path_from_git_dir"]
        Jekyll.logger.info data["title"]
        Jekyll.logger.info doc.url

        html = Nokogiri::HTML(doc.content)

        # Extract all links from the DOM and crudely select only URLs beginning with '/'
        links = html.xpath('//a/@href').map { |attr| attr.value }.select{ |attr| attr[/^\//] }

        Jekyll.logger.info links
        Jekyll.logger.info links.count

        # require 'irb'
        # binding.irb
      end

      def site_link_report(site, payload)
        # Jekyll::Site
        # Jekyll.logger.info site.pages
        # Jekyll::Drops::UnifiedPayloadDrop
        # Jekyll.logger.info payload
        # Jekyll.logger.info payload.site  # just seems to return Pages, not posts

        Jekyll.logger.info payload.site.posts 

        # Each element is a Jekyll::Document
        payload.site.posts.each do |post|
          Jekyll.logger.info "#{post.url},#{post.data["title"]}" # post.url
          # Jekyll.logger.info post.data["title"]

          # TODO load the post and count the number of links.
        end

        # require 'irb'
        # binding.irb
      end
    end
  end
end

# Jekyll::Hooks.register :site, :post_render do |site, payload|
#   Jekyll::LinkReport.site_link_report(site, payload)
# end

Jekyll::Hooks.register :documents, :post_render do |doc|
  Jekyll::LinkReport.doc_link_report(doc)
end

# require "jekyll/commands/report.rb"

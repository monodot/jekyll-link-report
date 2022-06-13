require "nokogiri"

module Jekyll
  module LinkAudit

    class << self
      def doc_link_report(doc)
        # Ruby methods return the last value they produced!

        html = Nokogiri::HTML(doc.content)

        # Extract all links from the DOM and crudely select only URLs beginning with '/'
        urls = html.xpath('//a/@href').map { |attr| attr.value }.select{ |attr| attr[/^\//] }

        # Jekyll.logger.info links
        # Jekyll.logger.info links.count

        # Return this back to the caller
        # @doc_link_report = links

        # require 'irb'
        # binding.irb
      end
    end
  end
end

Jekyll::Hooks.register :documents, :post_render do |doc, output|
  doc.data["links"] = Jekyll::LinkAudit.doc_link_report(doc)
end

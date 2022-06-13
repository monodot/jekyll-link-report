require "nokogiri"
require "json"

module Jekyll
  class JekyllLinkReport < Jekyll::Generator
    # DEFAULT_MESSAGE = "henlo"

    def generate(site)
      @site = site
      @site.pages << linkreport unless file_exists?("links.csv")
    end

    # Matches all whitespace that follows
    #   1. A '>' followed by a newline or
    #   2. A '}' which closes a Liquid tag
    # We will strip all of this whitespace to minify the template
    MINIFY_REGEX = %r!(?<=>\n|})\s+!.freeze

    # Path to sitemap.xml template file
    def source_path(file = "links.csv")
      File.expand_path "../#{file}", __dir__
    end

    # Basically generate a new page, with a layout, content, etc.
    def linkreport
      link_report = PageWithoutAFile.new(@site, __dir__, "", "links.csv")
      link_report.content = File.read(source_path).gsub(MINIFY_REGEX, "")
      link_report.data["layout"] = nil
      # link_report.content = JSON.generate({:hello => "goodbye"})
      link_report
    end

    # Checks if a file already exists in the site source
    def file_exists?(file_path)
      pages_and_files.any? { |p| p.url == "/#{file_path}" }
    end

    def pages_and_files
      @pages_and_files ||= @site.pages + @site.static_files
    end


  end
end


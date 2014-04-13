pages = sitemap.resources.find_all { |p| p.source_file.match(/\.html/) }

xml.instruct!
xml.urlset "xmlns" => "http://www.sitemaps.org/schemas/sitemap/0.9" do
  pages.each do |page|
    xml.url do
      xml.loc URI.join(site_url, page.url)
      xml.priority 0.7
    end
  end
end

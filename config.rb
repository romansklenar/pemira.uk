###
# Settings
###

set :site_url, "http://www.pemira.uk"
set :site_title, "Pemira Jewellery - Handcrafted Jewellery from London"
set :site_keywords, "beads, beading, seed beads, lentil beads, lentil drop beads, drop beads, czech glass, czech glass bead,  czech pressed glass, necklaces, bracelets, glass pearl, sparkles, rings, earrings, jewelry, jewellery, jewellery London, handcrafted jewellery, hand crafted jewellery, handmade jewellery, hand made jewellery, custom-made jewellery, czech jewellery, jewellery workshop, London jewellery workshops"
set :site_description, "London based handcrafted jewellery from czech glass"

###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", layout: false
#
# With alternative layout
# page "/path/to/file.html", layout: :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

page "feed.xml", layout: false
page "sitemap.xml", layout: false
page "robots.txt", layout: false

# Proxy pages (http://middlemanapp.com/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Asset Settings
set :css_dir,    'assets/stylesheets'
set :js_dir,     'assets/javascripts'
set :images_dir, 'assets/images'
set :fonts_dir,  'assets/fonts'

# Directories Settings
set :partials_dir, 'partials'
set :helpers_dir,  'helpers'
set :data_dir,     'data'

# Pretty URLs
activate :directory_indexes

# Serve compressed files
activate :gzip

# Add bower's directory to sprockets asset path
after_configuration do
  bower_config = JSON.parse(IO.read("#{root}/.bowerrc"))
  sprockets.append_path File.join("#{root}", bower_config["directory"])
end

# Development-specific configuration
configure :development do
  # Reload the browser automatically whenever files change
  activate :livereload

  # Disable Google Analytics
  activate :google_analytics do |ga|
    ga.tracking_id = false
  end
end

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"

  # Enable Google Analytics
  activate :google_analytics do |ga|
    ga.tracking_id = 'UA-50943857-1'
    ga.domain_name = 'pemira.uk'
    ga.allow_linker = true
  end
end

# Deployment configuration
activate :deploy do |deploy|
  deploy.method = :git
  deploy.build_before = true
  deploy.branch = 'gh-pages'
end

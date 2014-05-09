###
# Settings
###

set :site_url, "http://www.example.com"
set :site_title, "Bootstrap starter template 101"
set :site_keywords, "bootstrap, template"
set :site_description, "Lorem ipsum"

###
# Blog settings
###

# Time.zone = "UTC"

activate :blog do |blog|
  # This will add a prefix to all links, template references and source paths
  blog.prefix = "blog"

  blog.permalink = "{year}/{title}.html"
  # blog.sources = "{year}-{month}-{day}-{title}.html"
  # blog.taglink = "tags/{tag}.html"
  blog.layout = "blog"
  blog.summary_separator = /(READMORE)/
  blog.summary_length = 500
  # blog.year_link = "{year}.html"
  # blog.month_link = "{year}/{month}.html"
  # blog.day_link = "{year}/{month}/{day}.html"
  blog.default_extension = ".md"

  # blog.tag_template = "tag.html"
  # blog.calendar_template = "calendar.html"

  # Enable pagination
  # blog.paginate = true
  # blog.per_page = 10
  # blog.page_link = "page/{num}"
end

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
    ga.tracking_id = 'UA-4991910-11'
    ga.domain_name = 'mo-ostrava.cz'
    ga.allow_linker = true
  end
end

# Deployment configuration
activate :deploy do |deploy|
  deploy.method = :git
  deploy.build_before = true
  deploy.branch = 'gh-pages'
end

#Markdown
set :markdown_engine, :redcarpet

#Livereload
activate :livereload

### 
# Compass
###

# Susy grids in Compass
# First: gem install compass-susy-plugin
require 'susy'

# Change Compass configuration
compass_config do |config|
  config.output_style = :compact
end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
# 
# With no layout
# page "/path/to/file.html", :layout => false
# 
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
# 
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
helpers do
  def some_helper
    "Helping"
  end

  def nav_link(text, to, title = nil)
    if not title
      title = text
    end

    content_tag(:li) do
      content_tag(:a, text, :href => to, :title => title )
    end
  end

  # pass a list of {text: String, to: String, title: String} hashes
  def nav_list(*args)
    content_tag(:ul) do
      args.map{ |a| nav_link(a[:text], a[:to], a[:title]) }.join("\n")
    end
  end
end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css
  
  # Minify Javascript on build
  activate :minify_javascript
  
  # Create favicon/touch icon set from source/favicon_base.png
  activate :favicon_maker
  
  # Enable cache buster
  # activate :cache_buster
  
  # Use relative URLs
  # activate :relative_assets
  
  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher
  
  # Or use a different image path
  # set :http_path, "/Content/images/"
end

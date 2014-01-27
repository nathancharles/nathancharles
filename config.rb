require 'compass-normalize'
require 'modernizr'

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
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

data.projects.each do |project|
  proxy "/#{project.shortName.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')}.html", "/templates/projects.html", :locals => { :project => project }, :ignore => true
end

###
# Helpers
###

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :images_dir, 'images'
config[:layouts_dir] = '_layouts'

activate :directory_indexes
activate :relative_assets

# Build-specific configuration
configure :build do
  activate :minify_css
  activate :minify_javascript
end

sprockets.append_path Modernizr.path

# Activate sync extension
activate :sync do |sync|
  sync.fog_provider = data.aws.fog_provider # Your storage provider
  sync.fog_directory = data.aws.fog_directory # Your bucket name
  sync.fog_region = data.aws.fog_region # The region your storage bucket is in (eg us-east-1, us-west-1, eu-west-1, ap-southeast-1 )
  sync.aws_access_key_id = data.aws.aws_access_key_id # Your Amazon S3 access key
  sync.aws_secret_access_key = data.aws.aws_secret_access_key # Your Amazon S3 access secret
  sync.existing_remote_files = 'delete' # What to do with your existing remote files? ( keep or delete )
  # sync.gzip_compression = false # Automatically replace files with their equivalent gzip compressed version
  # sync.after_build = false # Disable sync to run after Middleman build ( defaults to true )
end

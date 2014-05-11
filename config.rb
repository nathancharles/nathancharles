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

ignore "/contact.haml"

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

activate :s3_sync do |s3_sync|
  s3_sync.bucket                     = data.aws.bucket # The name of the S3 bucket you are targetting. This is globally unique.
  s3_sync.region                     = data.aws.region     # The AWS region for your bucket.
  s3_sync.aws_access_key_id          = data.aws.aws_access_key_id
  s3_sync.aws_secret_access_key      = data.aws.aws_secret_access_key
  s3_sync.delete                     = false # We delete stray files by default.
  s3_sync.after_build                = false # We do not chain after the build step by default.
  s3_sync.prefer_gzip                = true
  s3_sync.path_style                 = true
  s3_sync.reduced_redundancy_storage = false
  s3_sync.acl                        = 'public-read'
  s3_sync.encryption                 = false
end

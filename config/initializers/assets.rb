# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w( simple.css ie9.css mapplic-ie.css themes/calendar.css)
Rails.application.config.assets.precompile += %w( plupload.full.min.js isotope.pkgd.min.js masonry-horizontal.js pages.calendar.min.js calendar.js scripts.js)

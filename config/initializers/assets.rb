# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w(blogs.scss simplemde.min.js blog.js select2-init.js simplemde-init.js)
Rails.application.config.assets.precompile += %w(blog_sidebar.scss github-markdown.scss about_me.css header.scss commontator/comments.scss)
Rails.application.config.assets.paths << Rails.root.join('app', 'assets', 'fonts')
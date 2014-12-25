# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( videos.css )
Rails.application.config.assets.precompile += %w( videos.js )

Rails.application.config.assets.precompile += %w( playlists.css )
Rails.application.config.assets.precompile += %w( playlists.js )

Rails.application.config.assets.precompile += %w( comments.css )
Rails.application.config.assets.precompile += %w( comments.js )

Rails.application.config.assets.precompile += %w( users.css )
Rails.application.config.assets.precompile += %w( users.js )

Rails.application.config.assets.precompile += %w( sessions.css )
Rails.application.config.assets.precompile += %w( sessions.js )
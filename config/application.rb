require_relative 'boot'

require 'rails/all'

#按照论坛同学设置视频功能用的，但是貌似有冲突，先禁了
# config.assets.paths << "#{Rails.root}/app/assets/images"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Myapp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end

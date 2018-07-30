require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Domino
  class Application < Rails::Application
    config.load_defaults 5.1

    config.paths.add 'lib', eager_load: true

    config.assets.paths << Rails.root.join('vendor', 'assets', 'javascripts')

    config.time_zone = 'Tokyo'

    # DB保存時のタイムゾーンをJSTに変更
    config.active_record.default_timezone = :local

    I18n.config.available_locales = [:ja, :en]
    config.i18n.default_locale = :ja
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
  end
end

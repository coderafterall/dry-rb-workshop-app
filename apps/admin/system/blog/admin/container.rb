require "pathname"
require "dry/web/container"
require "dry/system/components"

module Blog
  module Admin
    class Container < Dry::Web::Container
      require root.join("system/blog/container")
      import core: Blog::Container

      configure do |config|
        config.root = Pathname(__FILE__).join("../../..").realpath.dirname.freeze
        config.logger = Blog::Container[:logger]
        config.default_namespace = "blog.admin"
        config.auto_register = %w[lib/blog/admin]
      end

      load_paths! "lib"
    end
  end
end

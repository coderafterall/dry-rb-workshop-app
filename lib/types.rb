require "dry-struct"
require "dry-types"

module Types
  include Dry::Types.module

  ArticleStatus = Types::Strict::String.default("draft").enum("draft", "published")
end

require "dry/validation"
require "types"

module Blog
  module Admin
    module Articles
      FormSchema = Dry::Validation.Form do
        required(:title).filled
        required(:status).filled(Types::ArticleStatus)
        optional(:published_at).maybe(:time?)
      end
    end
  end
end

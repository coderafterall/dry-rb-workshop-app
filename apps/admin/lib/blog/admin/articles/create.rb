require "blog/operation"
require "blog/admin/import"
require_relative "form_schema"

module Blog
  module Admin
    module Articles
      class Create < Blog::Operation
        include Import["article_repo"]

        def call(attributes)
          validation = FormSchema.(attributes)

          if validation.success?
            Right(article_repo.create(validation.to_h))
          else
            Left(validation)
          end
        end
      end
    end
  end
end

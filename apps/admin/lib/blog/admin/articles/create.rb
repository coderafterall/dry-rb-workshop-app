require "blog/admin/import"
require "dry/monads"

module Blog
  module Admin
    module Articles
      class Create
        include Blog::Admin::Import["article_repo"]

        def call(attributes)
          validation = FormSchema.(attributes)

          if validation.success?
            Dry::Monads::Right(article_repo.create(validation.to_h))
          else
            Dry::Monads::Left(validation)
          end
        end
      end
    end
  end
end

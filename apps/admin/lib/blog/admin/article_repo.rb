require "blog/repository"
require_relative "entities"

module Blog
  module Admin
    class ArticleRepo < Blog::Repository[:articles]
      struct_namespace Entities

      commands :create

      def by_id(id)
        articles
          .by_pk(id)
          .one
      end

      def listing
        articles
          .order(Sequel.desc(:created_at))
      end

      private

      def articles
        super.combine(:author)
      end
    end
  end
end

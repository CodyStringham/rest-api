module Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    Kaminari::Hooks.init
    Elasticsearch::Model::Response::Response.__send__ :include, Elasticsearch::Model::Response::Pagination::Kaminari

    # mapping do
    #   # ...
    # end

    # def self.search(query)
    #   __elasticsearch__.search(
    #     {
    #       query: {
    #         multi_match: {
    #           query: query,
    #           fields: ['title^10', 'text']
    #         }
    #       },
    #       highlight: {
    #         pre_tags: ['<em>'],
    #         post_tags: ['</em>'],
    #         fields: {
    #           title: {},
    #           text: {}
    #         }
    #       }
    #     }
    #   )
    # end

  end
end

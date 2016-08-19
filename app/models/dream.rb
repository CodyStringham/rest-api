class Dream < ActiveRecord::Base
  include Searchable
  belongs_to :user
  validates :user_id, :date, :category, :description, presence: true
  validates_inclusion_of :category, :in => %w( Fantasy Psychic Nightmare Surreal )

  def as_indexed_json(options={})
    as_json(
      include: {
        user: { only: :name }
      }
    )
  end
end


# '{
#   "query": {
#     "match": {
#       "category": "Nightmare"
#     }
#   }
# }'
# '{"query": {"match": {"category": "Nightmare"} } }'

# '{
#   "query": {
#     "bool": {
#       "must": {
#         "match": {
#           "category": "Nightmare"
#         }
#       },
#       "should": {
#         "match": {
#           "description": "molestiae"
#         }
#       }
#     }
#   }
# }'
# '{"query": {"bool": {"must": {"match": {"category": "Nightmare"} }, "should": {"match": {"description": "molestiae"} } } } }'





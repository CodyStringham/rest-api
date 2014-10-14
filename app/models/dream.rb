class Dream < ActiveRecord::Base
  belongs_to :user
  validates :user_id, :date, :category, :description, presence: true
  validates_inclusion_of :category, :in => %w( Fantasy Psychic Nightmare Surreal )
end

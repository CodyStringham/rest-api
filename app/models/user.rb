class User < ActiveRecord::Base
  include Searchable

  has_many :dreams, dependent: :destroy
  validates :name, :age, :city, :state, presence: true
  validates_inclusion_of :age, :in => 0..99


  def as_indexed_json(options={})
    as_json(
      include: {
        dreams: { only: [:category, :description] }
      }
    )
  end
end
